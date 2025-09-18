# Lab Workshop – Unit IV: Container Orchestration with Kubernetes

This lab aligns with Unit IV theory topics and provides hands-on practice.  
Each section corresponds to the **forenoon** or **afternoon** theory session.  

---

## 🌞 Forenoon Lab (After Theory Session 1)

### 1. Kubernetes Overview
- Verify your local machine has Docker installed (Minikube requires it):
  ```bash
  docker --version
  ```

* Install **kubectl**:

  * [kubectl install guide](https://kubernetes.io/docs/tasks/tools/)
* Confirm kubectl is installed:

  ```bash
  kubectl version --client
  ```

---

### 2. Core Concepts (Pod, ReplicaSet, Deployment, Service)

* Create a sample pod using kubectl:

  ```bash
  kubectl run hello-pod --image=nginx --port=80
  ```
* Check pod status:

  ```bash
  kubectl get pods
  ```
* Describe the pod:

  ```bash
  kubectl describe pod hello-pod
  ```
* Delete the pod:

  ```bash
  kubectl delete pod hello-pod
  ```

---

### 3. Installing Minikube

* Install Minikube:

  * [Minikube install guide](https://minikube.sigs.k8s.io/docs/start/)
* Start the cluster:

  ```bash
  minikube start
  ```
* Verify cluster status:

  ```bash
  kubectl cluster-info
  kubectl get nodes
  ```

---

### 4. kubectl Basics

* Check cluster nodes and namespaces:

  ```bash
  kubectl get nodes
  kubectl get ns
  ```
* Deploy a sample nginx app:

  ```bash
  kubectl create deployment nginx-deploy --image=nginx
  ```
* View running resources:

  ```bash
  kubectl get deployments
  kubectl get pods
  ```
* Get logs of the pod:

  ```bash
  kubectl logs -l app=nginx
  ```

---

## 🌆 Afternoon Lab (After Theory Session 2)

### 1. Creating and Scaling Deployments

* Create a deployment:

  ```bash
  kubectl create deployment myapp --image=nginx --replicas=1
  ```
* View pods:

  ```bash
  kubectl get pods
  ```
* Scale the deployment:

  ```bash
  kubectl scale deployment myapp --replicas=3
  ```
* Verify scaling:

  ```bash
  kubectl get pods -o wide
  ```

---

### 2. Service Types (ClusterIP, NodePort, LoadBalancer)

* Expose the deployment as a **ClusterIP** service:

  ```bash
  kubectl expose deployment myapp --port=80 --target-port=80 --type=ClusterIP
  ```
* Expose as a **NodePort** service:

  ```bash
  kubectl expose deployment myapp --port=80 --target-port=80 --type=NodePort
  kubectl get svc
  minikube service myapp --url
  ```
* If supported, expose as a **LoadBalancer**:

  ```bash
  kubectl expose deployment myapp --type=LoadBalancer --port=80
  ```

---

### 3. ConfigMaps and Secrets

* Create a ConfigMap:

  ```bash
  kubectl create configmap app-config --from-literal=APP_MODE=dev
  ```
* Create a Secret:

  ```bash
  kubectl create secret generic db-secret --from-literal=DB_PASSWORD=MyPass123
  ```
* Verify ConfigMap and Secret:

  ```bash
  kubectl get configmaps
  kubectl get secrets
  ```
* Mount ConfigMap as env variable:

  ```yaml
  apiVersion: v1
  kind: Pod
  metadata:
    name: config-demo
  spec:
    containers:
    - name: demo
      image: alpine
      command: ["sh", "-c", "echo App mode is $APP_MODE && sleep 3600"]
      env:
      - name: APP_MODE
        valueFrom:
          configMapKeyRef:
            name: app-config
            key: APP_MODE
  ```
* Apply and check logs:

  ```bash
  kubectl apply -f config-demo.yaml
  kubectl logs config-demo
  ```

---

### 4. Rolling Updates and Helm Introduction

* Perform a rolling update:

  ```bash
  kubectl set image deployment/myapp nginx=nginx:1.25
  kubectl rollout status deployment/myapp
  ```
* Rollback if needed:

  ```bash
  kubectl rollout undo deployment/myapp
  ```
* Install Helm (package manager for Kubernetes):

  * [Helm install guide](https://helm.sh/docs/intro/install/)
* Verify Helm is installed:

  ```bash
  helm version
  ```
* Search for available charts:

  ```bash
  helm search hub nginx
  ```

---

## ✅ End of Unit IV Lab

By the end of Unit IV, students will be able to:

* Run a local Kubernetes cluster with Minikube.
* Deploy and scale containerized apps.
* Expose apps with different service types.
* Manage configuration with ConfigMaps & Secrets.
* Perform rolling updates and understand Helm basics.

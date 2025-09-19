# 🧑‍💻 UNIT – V : Cloud Deployment & Monitoring – Lab Exercises

## 🌞 Forenoon Lab Session: Cloud Deployment & IaC

### **Exercise 1: Push Docker Image to a Cloud Registry**

1. Build a sample Docker image locally:

   ```bash
   docker build -t myapp:1.0 .
   ```
2. Tag the image for AWS ECR (replace with your AWS account ID & region):

   ```bash
   docker tag myapp:1.0 <AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com/myapp:1.0
   ```
3. Authenticate Docker to ECR:

   ```bash
   aws ecr get-login-password --region <REGION> | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com
   ```
4. Push image:

   ```bash
   docker push <AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com/myapp:1.0
   ```

---

### **Exercise 2: Deploy Containerized App to Cloud**

1. Create an ECS Fargate (AWS) or Cloud Run (GCP) service.
2. Deploy the pushed container image.
3. Access the public endpoint and verify the application is running.

---

### **Exercise 3: Introduction to Terraform**

1. Install Terraform:

   ```bash
   sudo apt-get update && sudo apt-get install -y terraform
   ```
2. Create a Terraform configuration (`main.tf`):

   ```hcl
   provider "aws" {
     region = "us-east-1"
   }

   resource "aws_instance" "devops_vm" {
     ami           = "ami-0c55b159cbfafe1f0" # Replace with valid AMI
     instance_type = "t2.micro"
   }
   ```
3. Run Terraform workflow:

   ```bash
   terraform init
   terraform plan
   terraform apply -auto-approve
   ```
4. Verify that the VM is created in AWS.

---

### **Exercise 4: Jenkins CI/CD Cloud Deployment**

1. Open Jenkins dashboard → **New Item → Pipeline**.
2. Use the following sample Jenkinsfile (deploys Docker image to AWS ECR):

   ```groovy
   pipeline {
     agent any
     stages {
       stage('Build') {
         steps {
           sh 'docker build -t myapp:latest .'
         }
       }
       stage('Push to ECR') {
         steps {
           sh '$(aws ecr get-login --no-include-email --region us-east-1)'
           sh 'docker tag myapp:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/myapp:latest'
           sh 'docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/myapp:latest'
         }
       }
     }
   }
   ```
3. Commit the Jenkinsfile to GitHub.
4. Trigger the pipeline → verify Docker image is deployed to ECR.

---

## 🌆 Afternoon Lab Session: Monitoring & Logging

### **Exercise 1: Install Prometheus**

1. Download Prometheus:

   ```bash
   wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz
   tar xvfz prometheus-*.tar.gz
   cd prometheus-*
   ```
2. Start Prometheus:

   ```bash
   ./prometheus --config.file=prometheus.yml
   ```
3. Open browser → `http://localhost:9090` → verify Prometheus UI.

---

### **Exercise 2: Monitor Sample Application**

1. Run a sample app with metrics endpoint (e.g., Node Exporter):

   ```bash
   docker run -d -p 9100:9100 prom/node-exporter
   ```
2. Add target to `prometheus.yml`:

   ```yaml
   scrape_configs:
     - job_name: 'node'
       static_configs:
         - targets: ['localhost:9100']
   ```
3. Restart Prometheus → verify metrics collection.

---

### **Exercise 3: Install Grafana & Build Dashboard**

1. Run Grafana container:

   ```bash
   docker run -d -p 3000:3000 grafana/grafana
   ```
2. Open Grafana → `http://localhost:3000` → login with `admin/admin`.
3. Add Prometheus as data source (`http://localhost:9090`).
4. Create a new dashboard with **CPU usage & memory usage** graphs.

---

### **Exercise 4: Log Management with ELK (Overview)**

*(Optional if time allows)*

1. Run Elasticsearch & Kibana with Docker:

   ```bash
   docker network create elk
   docker run -d --name elasticsearch --net elk -p 9200:9200 -e "discovery.type=single-node" elasticsearch:7.10.2
   docker run -d --name kibana --net elk -p 5601:5601 kibana:7.10.2
   ```
2. Access Kibana UI → `http://localhost:5601`.
3. Explore logs (students may use a sample log file).

---

✅ **Outcome:**

* Students will **deploy apps to the cloud using Docker + Terraform + Jenkins CI/CD** (forenoon).
* Students will **monitor and visualize applications with Prometheus + Grafana, and explore log management with ELK** (afternoon).

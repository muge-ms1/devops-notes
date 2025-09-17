# Lab Workshop – Unit III: Containerization with Docker

This lab aligns with Unit III theory topics and provides hands-on practice.  
Each section corresponds to the **forenoon** or **afternoon** theory topics.  

---

## 🌞 Forenoon Lab (After Theory Session 1)

### 1. Introduction to Containers
- Check if Docker is installed:
  ```bash
  docker --version
  docker run hello-world
  ```

* Explain output: confirms container runtime works.
* List running containers:

  ```bash
  docker ps
  ```
* List all containers (including stopped):

  ```bash
  docker ps -a
  ```

---

### 2. Docker vs Virtual Machines

* Compare resource usage:

  ```bash
  docker run -d nginx
  docker stats
  ```
* Check memory/CPU usage of a container vs a VM on your system.
* Stop and remove the container:

  ```bash
  docker stop <container_id>
  docker rm <container_id>
  ```
* Note: containers are lightweight compared to VMs.

---

### 3. Installing Docker

* Verify Docker engine is active:

  ```bash
  systemctl status docker   # Linux
  ```
* Run a simple container:

  ```bash
  docker run -it alpine sh
  ```
* Inside Alpine shell, test:

  ```bash
  echo "Hello from Alpine container"
  exit
  ```
* Confirm container exited:

  ```bash
  docker ps -a
  ```

---

### 4. Docker Architecture

* Inspect Docker info:

  ```bash
  docker info
  ```
* View configured registries (default = Docker Hub).
* Pull an image from Docker Hub:

  ```bash
  docker pull busybox
  docker images
  ```
* Run BusyBox container and test:

  ```bash
  docker run busybox echo "Container lifecycle test"
  ```

---

## 🌆 Afternoon Lab (After Theory Session 2)

### 1. Images and Containers

* Pull and run Nginx image:

  ```bash
  docker pull nginx
  docker run -d -p 8080:80 nginx
  ```
* Open [http://localhost:8080](http://localhost:8080) in a browser.
* Stop and remove container:

  ```bash
  docker stop <container_id>
  docker rm <container_id>
  ```
* Remove image:

  ```bash
  docker rmi nginx
  ```

---

### 2. Dockerfile Basics & Image Building

* Create a simple Dockerfile:

  ```dockerfile
  FROM alpine:3.18
  RUN echo "Hello from custom Docker image" > /message.txt
  CMD ["cat", "/message.txt"]
  ```
* Build and tag the image:

  ```bash
  docker build -t hello-docker:1.0 .
  ```
* Run the custom image:

  ```bash
  docker run hello-docker:1.0
  ```
* Check tagged images:

  ```bash
  docker images
  ```

---

### 3. Volume and Network Management

* Create a named volume:

  ```bash
  docker volume create mydata
  ```
* Run a container with persistent data:

  ```bash
  docker run -it -v mydata:/data alpine sh
  echo "Persistent Data" > /data/file.txt
  exit
  ```
* Start a new container with the same volume and confirm data exists:

  ```bash
  docker run -it -v mydata:/data alpine cat /data/file.txt
  ```
* Create a user-defined bridge network:

  ```bash
  docker network create mynet
  docker network ls
  ```

---

### 4. Multi-container Applications with Docker Compose

* Create a `docker-compose.yml`:

  ```yaml
  version: "3.8"
  services:
    web:
      image: nginx
      ports:
        - "8081:80"
    db:
      image: mysql:5.7
      environment:
        MYSQL_ROOT_PASSWORD: example
  ```
* Start containers:

  ```bash
  docker compose up -d
  ```
* Check running services:

  ```bash
  docker compose ps
  ```
* Stop and clean up:

  ```bash
  docker compose down
  ```

---

## ✅ End of Unit III Lab

By the end of Unit III, students will be able to:

* Run containers from Docker Hub.
* Build custom images with Dockerfiles.
* Use volumes and networks for persistence and communication.
* Run multi-container apps with Docker Compose.

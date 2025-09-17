# Lab Workshop – Unit II (Forenoon Session)
### Jenkins Setup & Basics

This session reinforces forenoon theory: CI/CD fundamentals, Jenkins overview, architecture, and installation.
Reference - https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/

---

## Step 1: Verify CI/CD Setup Tools
Ensure **Git**, **Docker**, and **Docker Compose** are installed:
  ```bash
  git --version
  docker --version
  docker compose version
  ```

---

## Step 2: Download Jenkins Tutorial Repo & Start Jenkins

1. Clone the Jenkins quickstart tutorials repository:

   ```bash
   git clone https://github.com/jenkins-docs/quickstart-tutorials.git
   cd quickstart-tutorials
   ```

2. Start Jenkins with the Maven profile:

   ```bash
   docker compose --profile maven up -d
   ```

3. Verify containers are running:

   ```bash
   docker compose ps
   ```

---

## Step 3: Access Jenkins

1. Open Jenkins in your browser: [http://localhost:8080](http://localhost:8080)
2. Retrieve the initial admin password:

   ```bash
   docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
   ```
3. Paste the password into the setup wizard.
4. Install **Suggested Plugins**.
5. Create your first **Admin User**.

---

## Step 4: Explore Jenkins Dashboard & Architecture

* Identify **Controller (Master)** → manages jobs, plugins, and scheduling.
* Navigate to **Manage Jenkins → Nodes and Clouds** to understand how build agents connect.
* Note: In this Docker setup, Jenkins runs as a single-node (controller = agent).

---

## Step 5: Configure Basic Plugins

1. Navigate to **Manage Jenkins → Plugins → Available Plugins**.
2. Install:

   * **Git plugin** (for version control integration)
   * **Pipeline plugin** (for later pipeline labs)
   * **Blue Ocean** (modern UI for pipelines)

---

✅ At the end of this forenoon lab you will have:

* Jenkins installed and running in Docker
* Admin user configured
* Key plugins installed
* Familiarity with Jenkins architecture and dashboard

Absolutely! Let's continue with the **Afternoon Session** of Unit II, focusing on building upon the foundational concepts covered in the Forenoon session. This session will guide students through creating a Jenkins pipeline for a Java application using Maven, as per the official Jenkins tutorial.

---

## 🧪 Afternoon Session: Hands-On Lab – Building a Java App with Maven Using Jenkins

### Objective:

* **Understand** the role of Jenkins in Continuous Integration and Continuous Deployment (CI/CD).
* **Implement** a Jenkins pipeline to automate the build and test processes of a Java application using Maven.

### Prerequisites:

* Completion of the Forenoon session, including:
* Installation and setup of Jenkins.
* Familiarity with the Jenkins dashboard and basic navigation.
* A local clone of the `simple-java-maven-app` repository, as discussed in the Forenoon session.

---

### 🔧 Step 1: Fork and Clone the Sample Repository

1. **Fork** the repository:

   * Visit the [simple-java-maven-app GitHub page](https://github.com/jenkins-docs/simple-java-maven-app).
   * Click on the **Fork** button to create a copy under your GitHub account.

2. **Clone** the repository to your local machine:

   ```bash
   git clone https://github.com/YOUR-USERNAME/simple-java-maven-app
   cd simple-java-maven-app
   ```

   Replace `YOUR-USERNAME` with your GitHub username.

---

### 🛠️ Step 2: Create a New Pipeline Project in Jenkins

1. **Access** Jenkins:

   * Open your browser and navigate to [http://localhost:8080](http://localhost:8080).

2. **Create a new item**:

   * From the Jenkins dashboard, click on **New Item**.
   * Enter a name for your project, e.g., `java-maven-pipeline`.
   * Select **Pipeline** and click **OK**.

3. **Configure the pipeline**:

   * In the **Pipeline** section:

     * Set **Definition** to *Pipeline script from SCM*.
     * Choose **Git** as the SCM.
     * Enter the repository URL: `https://github.com/YOUR-USERNAME/simple-java-maven-app`.
     * Specify the branch to build: `main`.
   * Click **Save**.

---

### 📄 Step 3: Create and Commit the Jenkinsfile

1. **Create a `Jenkinsfile`** in the root of your project directory:

   ```groovy
   pipeline {
     agent any
     stages {
       stage('Build') {
         steps {
           sh 'mvn -B -DskipTests clean package'
         }
       }
     }
   }
   ```

2. **Commit and push** the `Jenkinsfile` to your repository:

   ```bash
   git add Jenkinsfile
   git commit -m "Add Jenkins pipeline with build stage"
   git push origin main
   ```

---

### ▶️ Step 4: Run the Pipeline

1. **Trigger the build**:

   * In Jenkins, navigate to your project (`java-maven-pipeline`).
   * Click on **Build Now**.

2. **Monitor the build**:

   * Observe the progress and logs in the **Build Executor Status** and **Console Output**.

3. **Verify the build**:

   * Ensure that the build completes successfully, indicating that the Maven build process was executed correctly.

---

### 🧪 Step 5: Add a Test Stage to the Pipeline

1. **Modify the `Jenkinsfile`** to include a test stage:

   ```groovy
   pipeline {
     agent any
     stages {
       stage('Build') {
         steps {
           sh 'mvn -B clean package'
         }
       }
       stage('Test') {
         steps {
           sh 'mvn test'
         }
       }
     }
   }
   ```

2. **Commit and push** the changes:

   ```bash
   git add Jenkinsfile
   git commit -m "Add test stage to pipeline"
   git push origin main
   ```

3. **Run the pipeline** again:

   * In Jenkins, trigger a new build.
   * Monitor the execution of both the **Build** and **Test** stages.

---

### 📦 Step 6: Add a Deliver Stage to the Pipeline

1. **Update the `Jenkinsfile`** to include a deliver stage:

   ```groovy
   pipeline {
     agent any
     stages {
       stage('Build') {
         steps {
           sh 'mvn -B clean package'
         }
       }
       stage('Test') {
         steps {
           sh 'mvn test'
         }
       }
       stage('Deliver') {
         steps {
           archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
         }
       }
     }
   }
   ```

2. **Commit and push** the changes:

   ```bash
   git add Jenkinsfile
   git commit -m "Add deliver stage to pipeline"
   git push origin main
   ```

3. **Run the pipeline**:

   * Trigger a new build in Jenkins.
   * Ensure that all three stages (**Build**, **Test**, and **Deliver**) execute successfully.

---

### ✅ Conclusion

By the end of this session, you should have:

* A functional Jenkins pipeline that automates the build, test, and delivery processes of a Java application using Maven.
* Gained hands-on experience with Jenkins' pipeline syntax and stages.
* Understood the integration of Jenkins with version control systems like Git.


## 🎯 Objectives

* Install and configure Git on your local machine
* Initialize a Git repository and make your first commit
* Connect to a remote repository (GitHub/GitLab)
* Practice basic Git commands for version control

---

## 🛠️ Prerequisites

* A GitHub or GitLab account
* Git installed on your system

  * [Download Git](https://git-scm.com/downloads)

---

## 🔹 Step 1: Configure Git

Set up your name and email (only once per machine):

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Verify configuration:

```bash
git config --list
```

---

## 🔹 Step 2: Initialize a Local Repository

Create a new project folder and initialize Git:

```bash
mkdir devops-lab
cd devops-lab
git init
```

Check Git status:

```bash
git status
```

---

## 🔹 Step 3: Create Files and Commit

Create a sample file:

```bash
echo "# My First DevOps Project" > README.md
```

Stage and commit:

```bash
git add README.md
git commit -m "Initial commit: Added README"
```

---

## 🔹 Step 4: Connect to Remote Repository

1. Create a new empty repo on GitHub/GitLab (do not initialize with README).
2. Copy the remote repository URL.
3. Connect local repo with remote:

```bash
git remote add origin <your-remote-repo-url>
```

Push changes:

```bash
git push -u origin master
```

---

## 🔹 Step 5: Clone a Remote Repository

Try cloning another repo:

```bash
git clone <any-public-repo-url>
cd <repo-folder>
```

Check commit history:

```bash
git log --oneline
```

---

## 🔹 Step 6: Pull Updates from Remote

If changes are made in GitHub:

```bash
git pull origin master
```

---

**Course:** Industrial Practicals with DevOps
**Topic:** Branching, Merging, Conflicts & Pull Requests

---

## 🎯 Objectives

* Work with branches in Git
* Implement a basic branching workflow
* Perform merges and resolve conflicts
* Create Pull Requests (PRs) and conduct code reviews

---

## 🛠️ Prerequisites
* At least one collaborator (pair with another student or use two accounts)

---

## 🔹 Step 1: Create and Switch Branches

Create a new feature branch and switch to it:

```bash
git checkout -b feature-hello
```

Verify branch:

```bash
git branch
```

---

## 🔹 Step 2: Make Changes in Feature Branch

Edit the `README.md` or add a new file:

```bash
echo "Hello from feature branch!" >> hello.txt
git add hello.txt
git commit -m "Added hello.txt in feature branch"
```

Push the branch to remote:

```bash
git push -u origin feature-hello
```

---

## 🔹 Step 3: Merge Branch into Main

Switch back to main branch:

```bash
git checkout master
```

Merge the feature branch:

```bash
git merge feature-hello
```

Push updated main branch:

```bash
git push origin master
```

---

## 🔹 Step 4: Simulate a Merge Conflict

1. On `master`, edit `hello.txt` → add this line:

```
Hello from main branch!
```

Commit and push.

2. On `feature-hello`, edit the **same line** differently:

```
Hello from feature branch!
```

Commit and push.

3. Try merging `feature-hello` into `master`:

```bash
git merge feature-hello
```

You’ll see a **merge conflict**.

---

## 🔹 Step 5: Resolve Merge Conflict

1. Open the conflicted file, you’ll see conflict markers:

```
<<<<<<< HEAD
Hello from main branch!
=======
Hello from feature branch!
>>>>>>> feature-hello
```

2. Edit the file to keep the correct/final content:

```
Hello from both branches!
```

3. Stage and commit resolved file:

```bash
git add hello.txt
git commit -m "Resolved merge conflict in hello.txt"
```

Push changes:

```bash
git push origin master
```

---

## 🔹 Step 6: Create a Pull Request (PR)

1. Push a new branch (e.g., `feature-readme`) with a small change.
2. On GitHub/GitLab, open a Pull Request targeting `master`.
3. Request a review from a collaborator.
4. Add review comments (approve/change request).
5. Merge PR into `master`.

---

## ✅ Expected Outcome

By the end of this lab, you should be able to:

* Create and manage branches
* Merge branches and handle conflicts
* Push and pull branches from remote
* Open Pull Requests and perform code reviews

---


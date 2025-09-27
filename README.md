# 🚀 CI/CD Pipeline – GitHub Actions + Docker + Kubernetes + ArgoCD
### Deploy Python  App on Kubernetes cluster or minikube with GitOps Approach
### This is a GitHub Actions workflow configuration file written in YAML. It's designed to automate Docker image building,push dockerhub and deployment updates gitops whenever a push happens to the main branch.
### Let’s break it down step by step:
# 🚀 GitHub Actions CI/CD Pipeline: Build and Test

This repository contains a GitHub Actions workflow that lints code, builds a Docker image, and updates a Kubernetes manifest in an ArgoCD-managed repo.

## 📂 Workflow: `Build and Test`

### 🔧 Trigger Type

This workflow is manually triggered using the `workflow_dispatch` event.

### 🧾 Inputs

- `environment`: The target environment for deployment.
  - Options: `dev`, `Prod`
  - Default: `dev`

### 🛠️ Workflow Steps

1. **Checkout Code**
2. **Set up Python (3.9)**
3. **Install Dependencies**
4. **Run Linting** with `flake8`
5. **Docker Login** (via GitHub Secrets)
6. **Build & Tag Docker Image**
7. **Push Docker Image to Docker Hub**
8. **Clone ArgoCD Manifest Repo**
9. **Update Image Tag in Kubernetes Manifest**
10. **Commit and Push Manifest Changes**

## 🔐 Secrets Required

- `DOCKER_USERNAME`: Docker Hub username
- `DOCKER_PASSWORD`: Docker Hub password/token
- `TOKEN`: GitHub token with write access to `argocd-example-apps` repo

## 📁 ArgoCD Repo Structure

The `argocd-example-apps` repo is expected to have this structure:

## let’s break down this step from your GitHub Actions workflow:

- name: Docker tag
  id: version
  run: |
    VERSION=vWeatherapp$(date +"%Y%m%d%H%M%S")
    echo "VERSION=$VERSION" >> $GITHUB_ENV
## This step generates a unique Docker image tag using the current date and time, and makes that tag available to the rest of the workflow via the VERSION environment variable.
🔍 Line-by-Line Breakdown:
## VERSION=vWeatherapp$(date +"%Y%m%d%H%M%S")
## Creates a variable called VERSION

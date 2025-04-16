# DevOps Assignment – Ruby Sample Application

##  Project Overview

This repository contains a sample Ruby application created as part of a DevOps assignment. The project demonstrates end-to-end DevOps practices including source control, CI/CD pipeline setup, Dockerization, infrastructure provisioning, and deployment.

## Tech Stack & Tools
- **Language**: Ruby (with or without Rails)
- **Version Control**: Git & GitHub
- **CI/CD**: Jenkins
- **Containerization**: Docker
- **Infrastructure Provisioning**: Terraform (AWS EC2)
- **Deployment**: Docker run on EC2

##  Branching Strategy
- `main`: Stable production-ready code
- `dev`: Active development branch

## CI/CD Pipeline Overview

The Jenkins pipeline is configured to:
- Trigger on every commit or pull request
- Run linting or test jobs
- Build a Docker image
- Push the image to Docker Hub

## Docker

The Ruby application is containerized using a lightweight Docker image. A custom `Dockerfile` is provided to build and tag the image.

## Infrastructure

Terraform is used to provision:
- A basic AWS EC2 instance (Ubuntu)
- Security group and key pair setup


## 🧭 Deployment Steps

1. Terraform provisions EC2
2. Docker is installed on EC2
3. Docker image is pulled and run on the instance

## How to Run

```bash
# Clone the repository
git clone https://github.com/your-username/devops-assignment.git

# Navigate to the app
cd devops-assignment

# Run Docker container (example)
docker build -t ruby-app .
docker run -p 3000:3000 ruby-app

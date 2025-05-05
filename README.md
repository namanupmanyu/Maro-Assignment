# DevOps Assignment – Ruby Sample Application

## 📌 Project Overview
This repository showcases a sample Ruby on Rails application developed as part of a DevOps assignment. The project demonstrates a complete DevOps lifecycle, including:
- Source code management
- Continuous Integration and Deployment
- Infrastructure provisioning
- Configuration management
- Docker Compose-based deployment and rollback on AWS

## 🛠 Tech Stack & Tools
- Language: Ruby on Rails
- Version Control: Git & GitHub
- CI/CD: Jenkins
- Containerization: Docker, Docker Compose
- Infrastructure Provisioning: Terraform (AWS EC2)
- Configuration Management: Ansible
- Deployment: Docker container managed via Docker Compose on EC2

## 🔍 Ruby on Rails and MVC Architecture
Ruby on Rails (RoR) is a web development framework that follows the MVC (Model-View-Controller) pattern:
- Model: Manages data and business logic
- View: Handles presentation and user interface
- Controller: Coordinates between the view and model, handling user input
This architecture ensures the application is modular, maintainable, and scalable.

## 🌿 Branching Strategy
master:
- The production branch
- Only stable, tested, and approved code is merged here
- Jenkins is triggered on changes to this branch  
dev:
- Used for development and testing
- Not connected to the deployment pipeline.

## 🔁 CI/CD Pipeline (Jenkins)
- Triggered automatically when changes are pushed to the main branch on GitHub (via webhook)
- Builds the Docker image for the Ruby on Rails application
- Tags and pushes the image to Docker Hub
- Uses Docker Compose to deploy the latest image on the EC2 instance

## 🐳 Docker & Docker Compose
- The application is containerized using Docker
- Docker Compose is used to manage the deployment on EC2
- Supports simple rollback by changing image tags in the Compose file

## 🌩 Infrastructure Provisioning (Terraform)
- Provisions AWS EC2 with a public IP and security groups
- Infrastructure as code ensures consistency and repeatability

## ⚙️ Configuration Management (Ansible)
- Automates the installation of Docker and Docker Compose on EC2
- Ensures consistent server configuration

## 🚀 Deployment Workflow
1. Developer merges the tested code into the main branch  
2. GitHub webhook triggers Jenkins pipeline  
3. Docker image is built, tagged, and pushed to Docker Hub  
4. EC2 pulls the latest image  
5. Docker Compose deploys the app

## 📚 Learnings
- Ruby on Rails MVC architecture  
- Automating CI/CD with Jenkins  
- Managing containers with Docker and Docker Compose  
- Provisioning infrastructure using Terraform  
- Server setup using Ansible  
- Real-world DevOps workflow and deployment best practices

## ⚠️ Challenges Faced

1️⃣ Manual Container Management with Docker Run  
Initially, we were using docker run to deploy the application on the EC2 instance. This approach had the following limitations:
- Manual execution for every update
- Lack of version tracking and rollback options
- Increased risk of errors during deployment  
To resolve this, we adopted Docker Compose, which simplified deployment and rollback by using a structured YAML file and supporting zero-downtime updates.

2️⃣ Using Ansible for the First Time  
This was the first time Ansible was used in the workflow. Challenges included:
- Learning YAML syntax for playbooks
- Understanding host file configuration
- Managing SSH keys and remote connectivity  
Overcoming these helped automate server setup and improved consistency across environments.

## ✅ How to Run the Project

1. Clone the Repository  
git clone <your-repo-url>

2. Provision Infrastructure Using Terraform  
terraform init  
terraform validate  
terraform plan  
terraform apply

3. Configure EC2 Instance with Ansible  
Sample host file:  
[web]  
<your-ec2-public-ip> ansible_user=ubuntu ansible_ssh_private_key_file=path/to/key.pem  
Run the playbook:  
ansible-playbook -i host playbook.yml

4. Push Code to GitHub  
git add .  
git commit -m "your message"  
git push origin main

5. Jenkins Pipeline Execution  
Jenkins automatically builds, tags, and pushes the image, then deploys with Docker Compose

6. Deployment Using Docker Compose on EC2  
docker pull your-dockerhub-username/image-name:tag  
docker-compose up -d

## 🔗 Set Up Jenkins Webhook & AWS Access

Create a GitHub Webhook for Jenkins  
1. Go to your GitHub repository → Settings → Webhooks → Add webhook  
2. Enter your Jenkins URL followed by /github-webhook/ (e.g., http://<your-jenkins-server>/github-webhook/)  
3. Choose application/json as the content type  
4. Select Just the push event  
5. Click "Add Webhook"  
Make sure your Jenkins server is accessible from the internet (use a public IP or domain name)

Generate AWS Access Keys for Terraform  
1. Open AWS Console → IAM → Users → Add User  
2. Enter a username and enable “Programmatic access”  
3. Assign policies like AmazonEC2FullAccess  
4. Complete and download the .csv file with the Access Key ID and Secret Access Key  
5. Run the following command to configure locally:  
aws configure


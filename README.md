# Azure Infrastructure Deployment via Azure DevOps
This project provisions essential Azure infrastructure — including Resource Group, VNET, Subnets, ACR, and AKS — using Terraform code hosted on GitHub and deployed through Azure DevOps Pipelines.

# Objective
The goal of this project is to:
Automate Azure infrastructure setup via Terraform
Use Azure DevOps pipelines for CI/CD
Follow a standardized DevOps approach for reproducible environments

# Project Structure
All infrastructure code is located in this GitHub repository:
├── terraform/
│   ├── main.tf              # All resource definitions
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Output values
│   ├── backend.tf           # Remote state configuration
├── azure-pipelines.yml      # Azure DevOps pipeline file
├── README.md

# What This Deploys
This project creates:
A Resource Group for all Azure resources
A Virtual Network and Subnet
An Azure Container Registry (ACR)
An Azure Kubernetes Service (AKS) cluster

# Prerequisites
Azure Subscription
Service Principal with Contributor and User Access Administrator roles
Azure DevOps Project
A working Azure DevOps Service Connection to your Azure subscription

# Setup Steps for New Joiners

Clone this repository on Local: git clone https://github.com/hussains8/Terraform-ADO.git
cd Terraform-ADO and you are ready to use this code

# Configure Service Connection in Azure DevOps
Go to Project Settings → Service Connections
Add a new Azure Resource Manager connection
Grant access to the desired subscription
Name it something like terraform-azure-connection (referenced in your pipeline)

# Set Up Azure DevOps Variable Group
In Azure DevOps → Pipelines → Library, create a variable group with:

# Variable Name	Description
terraformWorkingDirectory	Path to Terraform files (e.g. terraform)
tfServiceConnection	Name of the Azure service connection
bkstrgrp	Storage account RG for backend
bkstrg	Storage account name
bkcontainer	Blob container name for backend
bkstrgkey	File name for state (e.g., infra.tfstate)
runDestroy (optional)	Set to true to destroy resources

# Pipeline Flow (CI/CD)
When code is pushed to the main branch:
Terraform init is triggered
Terraform validate checks your code
Terraform plan outputs infrastructure changes
Terraform apply provisions or updates resources
The pipeline file used is:
📄 azure-pipelines.yml

# Optional: Destroy Resources
To destroy all resources:
Set runDestroy = true in the pipeline variables
Run the pipeline
This will:
Skip the usual deployment
Run terraform destroy

# Tips for New Joiners
Use the main.tf file to understand resource creation.
Review variables.tf for required inputs.
Use outputs.tf to find useful outputs like AKS name or ACR login server.
Keep sensitive values in Azure DevOps Variable Groups (not in code).
Always test changes in a personal branch before merging into main.

# Maintainers
For access, onboarding help, or debugging:
Contact: [Sadaf Hussain - Lead DevOps]
Email: sadaf.official964@gmail.com


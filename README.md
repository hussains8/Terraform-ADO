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
1. A Resource Group for all Azure resources
2. A Virtual Network and Subnet
3. An Azure Container Registry (ACR)
4. An Azure Kubernetes Service (AKS) cluster

# Prerequisites
1. Azure Subscription
2. Service Principal with Contributor and User Access Administrator roles
3. Azure DevOps Project
4. A working Azure DevOps Service Connection to your Azure subscription

# Setup Steps for New Joiners

1. Clone this repository on Local: git clone https://github.com/hussains8/Terraform-ADO.git
2. cd Terraform-ADO and you are ready to use this code

# Configure Service Connection in Azure DevOps
1. Go to Project Settings → Service Connections
2. Add a new Azure Resource Manager connection
3. Grant access to the desired subscription
4. Name it something like terraform-azure-connection (referenced in your pipeline)

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
1. Terraform init is triggered
2. Terraform validate checks your code
3. Terraform plan outputs infrastructure changes
4. Terraform apply provisions or updates resources
5. The pipeline file used is:
📄 azure-pipelines.yml

# Optional: Destroy Resources
To destroy all resources:
Set runDestroy = true in the pipeline variables
Run the pipeline
This will:
Skip the usual deployment
Run terraform destroy

# Tips for New Joiners
1. Use the main.tf file to understand resource creation.
2. Review variables.tf for required inputs.
3. Use outputs.tf to find useful outputs like AKS name or ACR login server.
4. Keep sensitive values in Azure DevOps Variable Groups (not in code).
5. Always test changes in a personal branch before merging into main.

# Maintainers
For access, onboarding help, or debugging:
Contact: [Sadaf Hussain - Lead DevOps]
Email: sadaf.official964@gmail.com


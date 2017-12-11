# Example for Provisioning an AKS Cluster with TFE
This Terrform configuration provides an example for provisioning an AKS cluster with Terraform Enterprise (TFE) which requires a different process than what would be used when running Terraform on a local machine since the Azure CLI binary, az, is not present on TFE servers.

## Introduction
This Terraform configuration will create an Azure resource group, install the az binary, run the `az login` command, and then run the `az aks create` command to create the AKS cluster. Note that it uses a null_resource with a local-exec provisioner to create the AKS cluster since the Terraform Azure provider does not yet have a resource for AKS clusters.

## Instructions
You can use the original GitHub repository, rberlind/tfe-k8s-cluster-aks or create a fork of it. You do not actually need to clone the repository (or any fork of it) to your local machine since the Terraform code will be running on the Terraform Enterprise server after TFE downloads the code from GitHub.

1. Create a workspace on your TFE Enterprise Server (which could be the SaaS TFE server running at https://atlas.hashicorp.com).
1. Point your workspace at this repository or a fork of it.
1. On the Variables tab of your workspace, add a resource_group_name which will be the name of the resource group which TFE will create for you.
1. On the Variables tab of your workspace, add a dns_prefix Terraform variable and set it to a string which will be used as the initial segment of the DNS name for the AKS cluster. This must be globally unique.
1. On the Variables tab of your workspace, add the public_key Terraform variable and populate it with the contents of the public SSH key you want to upload to the AKS cluster so that you can then use your private SSH key from the same key pair to ssh to the cluster. Mark this as a sensitive variable so that nobody can read it after you save your variables.
1. Click the Save button to save your Terraform variables.
1. On the Variables tab of your workspace, add environment variables ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, and ARM_TENANT_ID and set them to the  credentials of an Azure service principal as described [here](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html).
1. Click the Save button to save your environment variables.
1. Click the "Queue Plan" button in the upper right corner of the workspace page.
1. After the Plan successfully completes, click the "Confirm and Apply" button at the bottom of the page.


## Destroying
Do the following to destroy the AKS cluster provisioned by this configuration.

1. On the Variables tab of your workspace, add an environment variable, CONFIRM_DESTROY, with value 1.
1. On the Settings tab of your workspace, click the "Queue destroy plan" button.
1. After the plan for the destroy completes, click the "Confirm and Apply" button at the bottom of the page to destroy the AKS cluster.

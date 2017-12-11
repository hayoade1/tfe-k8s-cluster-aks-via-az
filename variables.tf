variable "azure_location" {
  description = "Azure Location, e.g. North Europe"
  default = "East US"
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
}

variable "cluster_name" {
  description = "Name of the K8s cluster"
  default = "k8sexample-cluster"
}

variable "dns_prefix" {
  description = "DNS prefix for agent nodes"
}

variable "agent_count" {
  description = "Number of agent nodes"
  default = 1
}

variable "vm_size" {
  description = "Azure VM type for agents"
  default = "Standard_D2_v2"
}

variable "admin_user" {
  description = "Administrative username for the VMs"
  default = "azureuser"
}

variable "kubernetes_version" {
  description = "version of Kubernetes to use (e.g., 1.7.7 or 1.8.1)"
  default = "1.7.7"
}

variable "environment" {
  description = "value passed to ACS Environment tag"
  default = "dev"
}

variable "public_key" {
  description = "contents of SSH public key that will be used with AKS cluster"
}

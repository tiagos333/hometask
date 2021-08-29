variable "prefix" {
  description = "A prefix used for all resources in this example"
  default     = "aks"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default     = "West Europe"
}
variable "subnet_name"{
  description = "subnet name"
  default     = "subnet_aks"
}

variable "ip_cidr_network" {
 description = "Value of the Vnet address"
 default     = ["10.1.0.0/16"] 
}

variable "ip_cidr_subnetwork" {
 description = "Value of the subnet address"
 default     = ["10.1.0.0/24"] 
}

variable "resource_group_name" {
 description = "Resource Group Name"
 default     = "aks_resources"
}
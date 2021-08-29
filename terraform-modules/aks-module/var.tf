variable "prefix" {
  description = "A prefix used for all resources in this example"
  default     = "aks"
}

variable "resource_location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default     = "West Europe"
}

variable "resource_group" {
  description = "The Resouce Group Where this objects will live"
  default     = "rg"
}

variable "default_node_pool_name" {
  description = "The Name of the Node Pool Default"
  default     = "system"
}

variable "default_node_count" {
  description = "Quantity of the machines in the default node pool"
  default     = 1
}
variable "default_vm_size" {
  description = "Type of machine in the default node pool"
  default     = "Standard_DS2_v2"
}

variable "identity" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default     = "SystemAssigned"
}

variable "node_pool_name" {
  description = "The name of the Second node pool"
  default     = "app"
}
variable "vm_size" {
  description = "Type of machine in the second node pool"
  default     = "Standard_DS2_v2"
}
variable "node_pool_count" {
  description = "Quantity of the machines in the second node pool"
  default     = 1
}

variable "vnet_subnet" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default     = "id"
}

variable "enable_ingress" {
  description = "if the NGINX ingress controller was enabled"
  default     = false
}

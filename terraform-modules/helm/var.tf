variable "kubeconfig_host" {
  description = "Hostname of the kubeconfig file"
}

variable "kubeconfig_user" {
  description = "Username of the kubeconfig file"
}
variable "kubeconfig_pass" {
  description = "Password of the kubeconfig file"
}
variable "kubeconfig_cert" {
  description = "Certificate of the kubeconfig file"
}

variable "kubeconfig_key" {
  description = "Key of the kubeconfig file"
}
variable "kubeconfig_ca_cert" {
  description = "Ca Certificate of the kubeconfig file"
}

variable "helm_release_name" {
  description = "helm release name"
  default     = "bitnami_wordpress"
}
variable "helm_release_namespace" {
  description = "Which namespaces that you want install the app"
  default     = "default"
}
variable "helm_repository_name" {
  description = "Helm repository name"
  default     = "https://marketplace.azurecr.io/helm/v1/repo"
}

variable "helm_chart" {
  description = "Helm chart name"
  default     = "wordpress"
}
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

variable "helm_chart_key1" {
  description = "helm chart value 1"
  default     = "image.tag"
}
variable "helm_chart_value1" {
  description = "helm chart key 1 "
  default     = "5.8.0-debian-10-r18"
}

variable "helm_chart_key2" {
  description = "helm chart value 2"
  default     = "wordpressUsername"
}
variable "helm_chart_value2" {
  description = "helm chart key 2"
  default     = "value"
}

variable "helm_chart_key3" {
  description = "helm chart value 3"
  default     = "wordpressPassword"
}
variable "helm_chart_value3" {
  description = "helm chart key 3"
  default     = "pass"
}
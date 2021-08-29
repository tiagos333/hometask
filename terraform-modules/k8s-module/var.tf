variable "namespace" {
  description = "k8s namespace"
  default     = "hello-app"
}

variable "app_name" {
  description = "Name of k8s app"
  default     = "hello-kubernetes"
}

variable "labels_name" {
  description = "Name of app label"
  default     = "hello-kubernetes"
}

variable "spec_replicas" {
  description = "Quantity of app replicas"
  default     = 3
}

variable "match_labels_name" {
  description = "Label app name"
  default     = "hello-kubernetes"
}
variable "template_metadata_labels_name" {
  description = "Label Name of the template inside of the deployment app"
  default     = "hello-kubernetes"
}
variable "container_image" {
  description = "Name of app Image"
  default     = "paulbouwer/hello-kubernetes:1.8"
}
variable "container_name" {
  description = "Namespace name of the application"
  default     = "app"
}

variable "service_name" {
  description = "k8s namespace"
  default     = "Name of k8s service"
}

variable "service_port" {
  description = "App port exposed by the Service"
  default     = 80
}

variable "service_target_port" {
  description = "App port exposed by the Application"
  default     = 8080
}

variable "service_type" {
  description = "Service Type"
  default     = "LoadBalancer"
}

variable "ingress_name" {
  description = "Name of ingress object"
  default     = "hello-kubernetes"
}

variable "ingress_path" {
  description = "Path of the app ingress"
  default     = "/"
}

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

variable "resources_limits_cpu" {
  description = "CPU Limits of container"
}

variable "resources_limits_memory" {
  description = "Memory Limits of container"
}

variable "resources_request_cpu" {
  description = "CPU Requested by container"
}

variable "resources_request_memory" {
  description = "Memory Requested by container"
}


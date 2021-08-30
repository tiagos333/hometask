module "create_vnet"{
  source                    = "./vnet-module"
  prefix                    = "net"
  location                  = "East US"
  subnet_name               = "aks_net"
  ip_cidr_network           = ["192.168.0.0/16"]
  ip_cidr_subnetwork        = ["192.168.1.0/24"]
  resource_group_name       = "resource_group_test"
}

module "create_aks"{
  source                    = "./aks-module"
  prefix                    = "aks"
  resource_location         = "East US"
  resource_group            = module.create_vnet.resource_group_name
  default_node_pool_name    = "controlplane"
  default_node_count        = 1
  default_vm_size           = "Standard_DS2_v2"
  identity                  = "SystemAssigned"
  vnet_subnet               = module.create_vnet.subnet_id
  enable_ingress            = true
}

module "create_k8s_app" {
  source                    = "./k8s-module"
  namespace                 = "hello-app"
  kubeconfig_host           = module.create_aks.host
  kubeconfig_user           = module.create_aks.cluster_username
  kubeconfig_pass           = module.create_aks.cluster_password
  kubeconfig_cert           = module.create_aks.client_certificate
  kubeconfig_key            = module.create_aks.client_key
  kubeconfig_ca_cert        = module.create_aks.cluster_ca_certificate
  app_name                  = "hello-kubernetes"
  labels_name               = "hello-kubernetes"
  spec_replicas             = 3
  match_labels_name         = "hello-kubernetes"
  container_image           = "paulbouwer/hello-kubernetes:1.8"
  container_name            = "app"
  service_name              = "hello-kubernetes"
  service_port              = 80
  service_target_port       = 8080
  resources_limits_cpu      = "500m"
  resources_limits_memory   = "128Mi"
  resources_request_cpu     = "250m"
  resources_request_memory  = "64Mi"
  service_type              = "LoadBalancer"
  ingress_name              = "hello-kubernetes"
  ingress_path              = "/"
}

module "install_helm_wordpress"{
  source                    = "./helm-module"
  kubeconfig_host           = module.create_aks.host
  kubeconfig_user           = module.create_aks.cluster_username
  kubeconfig_pass           = module.create_aks.cluster_password
  kubeconfig_cert           = module.create_aks.client_certificate
  kubeconfig_key            = module.create_aks.client_key
  kubeconfig_ca_cert        = module.create_aks.cluster_ca_certificate
  helm_release_name         = "wordpress"
  helm_release_namespace    = "hello-app"
  helm_repository_name      = "https://marketplace.azurecr.io/helm/v1/repo"
}
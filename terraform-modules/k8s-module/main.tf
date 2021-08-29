provider "kubernetes" {
  host                   = var.kubeconfig_host
  username               = var.kubeconfig_user
  password               = var.kubeconfig_pass
  client_certificate     = base64decode(var.kubeconfig_cert)
  client_key             = base64decode(var.kubeconfig_key)
  cluster_ca_certificate = base64decode(var.kubeconfig_ca_cert)
}

#### Create Namespace
resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

#### Create Deployment
resource "kubernetes_deployment" "deploy-app" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
    labels    = {
         name = var.labels_name
    }
  }

  spec {
    replicas = var.spec_replicas

    selector {
      match_labels = {
        name = var.match_labels_name
      }
    }

    template {
      metadata {
        labels = {
          name = var.template_metadata_labels_name
        }
      }

      spec {
        container {
          image = var.container_image
          name  = var.container_name
          resources {
            limits = {
                 cpu    = var.resources_limits_cpu
                 memory = var.resources_limits_memory
            }
            requests = {
                 cpu    = var.resources_request_cpu
                 memory = var.resources_request_memory
            }
          }
        }
      }
    }
  }
}

#### Create Service
resource "kubernetes_service" "service" {
  metadata {
    name      = var.service_name
    namespace = var.namespace
  }
  spec {
    selector = {
      name = var.app_name
    }
    port {
      port        = var.service_port
      target_port = var.service_target_port
    }
    type = var.service_type
  }
}
### Create Ingress
resource "kubernetes_ingress" "ingress" {
  metadata {
    name      = var.ingress_name
    namespace = var.namespace
    annotations = {
        "kubernetes.io/ingress.class" = "addon-http-application-routing" 
    }
  }

  spec {
    backend {
      service_name = var.service_name
      service_port = var.service_port
    }

    rule {
      http {
        path {
          backend {
            service_name = var.service_name
            service_port = var.service_port
          }

          path = var.ingress_path
        }
      }
    }
  }
}

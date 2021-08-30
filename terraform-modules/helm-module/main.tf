provider "helm" {
  kubernetes {
     host                   = var.kubeconfig_host
     cluster_ca_certificate = base64decode(var.kubeconfig_ca_cert)
     username               = var.kubeconfig_user
     password               = var.kubeconfig_pass
     client_certificate     = base64decode(var.kubeconfig_cert)
     client_key             = base64decode(var.kubeconfig_key)
  }
}


resource "helm_release" "wordpress" {
  name       = var.helm_release_name
  namespace  = var.helm_release_namespace


  repository = var.helm_repository_name
  chart      = var.helm_chart

   values = [
    file("${path.module}/values.yaml")
  ]
}

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

  set {
    name  = var.helm_chart_key1
    value = var.helm_chart_value1
  }
  set {
    name  = var.helm_chart_key2
    value = var.helm_chart_value2
  }
  set {
    name  = var.helm_chart_key3
    value = var.helm_chart_value3
  }
}

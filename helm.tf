resource "helm_release" "nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  create_namespace = true
  namespace        = "ingress-nginx"
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  version    = "1.19.0"

  create_namespace = true
  namespace        = "external-dns"
  timeout          = 900

  values = [
    file("${path.module}/helm-values/external-dns.yaml")
  ]
}

resource "helm_release" "argocd_deploy" {

  name       = "argocd-2"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.19.15"
  timeout    = 600

  namespace        = "argo-cd"
  create_namespace = true

  values = [
    file("${path.module}/helm-values/argocd.yaml")
  ]
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.14.5"

  create_namespace = true
  namespace        = "cert-manager"
  timeout          = 600

  values = [
    file("${path.module}/helm-values/cert-manager.yaml")
  ]
}
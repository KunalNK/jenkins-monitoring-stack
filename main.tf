provider "helm" {
  kubernetes {
    config_path = "/home/vagrant/.kube/helm-test"
  }
}

provider "kubernetes" {
  config_path = "//home/vagrant/.kube/helm-test"
}


resource "kubernetes_namespace" "test-namespace" {
  metadata {
        name = "testing"
  }
}

resource "helm_release" "jenkins" {
  name       = "jenkins"
  namespace  = "testing"
  

  #repository = "https://charts.bitnami.com/bitnami"
  chart      = "/home/vagrant/terraform-kube/prometheus-grafana-jenkins/jenkins"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  namespace  = "testing"
  

  #repository = "https://charts.bitnami.com/bitnami"
  chart      = "/home/vagrant/terraform-kube/prometheus-grafana-jenkins/prometheus"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}


resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "testing"
  

  #repository = "https://charts.bitnami.com/bitnami"
  chart      = "/home/vagrant/terraform-kube/prometheus-grafana-jenkins/grafana"

  set {
    name  = "service.type"
    value = "NodePort"
  }
}
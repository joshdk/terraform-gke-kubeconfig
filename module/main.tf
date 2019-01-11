/**
 * # Terraform GKE Kubeconfig
 *
 * 📝 Terraform module that generates a Kubeconfig for accessing GKE clusters
 *
 * ## Usage:
 *
 * ```hcl
 * provider "google" {
 *   ...
 * }
 *
 * module "kubeconfig" {
 *   source = "github.com/joshdk/terraform-gke-kubeconfig//module"
 *
 *   auth_type         = "gcloud"
 *   gcloud_path       = "/usr/bin/gcloud"
 *   kubeconfig        = "/tmp/config.yml"
 *   name              = "my-cluster"
 *   zone              = "us-east1-a"
 * }
 * ```
 */

data "google_container_cluster" "cluster" {
  name   = "${var.name}"
  region = "${var.region}"
  zone   = "${var.zone}"
}

data "template_file" "kubeconfig-auth-cert" {
  template = "${file("${path.module}/config-auth-cert.tpl")}"

  vars {
    client_cert = "${data.google_container_cluster.cluster.master_auth.0.client_certificate}"
    client_key  = "${data.google_container_cluster.cluster.master_auth.0.client_key}"
  }
}

data "template_file" "kubeconfig-auth-gcloud" {
  template = "${file("${path.module}/config-auth-gcloud.tpl")}"

  vars {
    gcloud_path = "${var.gcloud_path}"
  }
}

data "template_file" "kubeconfig-auth-password" {
  template = "${file("${path.module}/config-auth-password.tpl")}"

  vars {
    password = "${data.google_container_cluster.cluster.master_auth.0.password}"
    username = "${data.google_container_cluster.cluster.master_auth.0.username}"
  }
}

locals {
  auth_types = {
    cert     = "${data.template_file.kubeconfig-auth-cert.rendered}"
    gcloud   = "${data.template_file.kubeconfig-auth-gcloud.rendered}"
    password = "${data.template_file.kubeconfig-auth-password.rendered}"
  }
}

data "template_file" "kubeconfig" {
  template = "${file("${path.module}/config.tpl")}"

  vars {
    auth                   = "${trimspace(lookup(local.auth_types, var.auth_type))}"
    cluster_ca_certificate = "${data.google_container_cluster.cluster.master_auth.0.cluster_ca_certificate}"
    endpoint               = "${data.google_container_cluster.cluster.endpoint}"
    suffix                 = "${data.google_container_cluster.cluster.project}_${coalesce(var.region, var.zone)}_${data.google_container_cluster.cluster.name}"
  }
}

resource "local_file" "kubeconfig" {
  content  = "${data.template_file.kubeconfig.rendered}"
  filename = "${var.kubeconfig}"
}

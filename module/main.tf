/**
 * # Terraform GKE Kubeconfig
 *
 * 📝 Terraform module that creates a Kubeconfig for accessing GKE clusters
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
 *   name   = "my-cluster"
 *   zone   = "us-east1-a"
 * }
 * ```
 */

data "google_container_cluster" "cluster" {
  name   = "${var.name}"
  region = "${var.region}"
  zone   = "${var.zone}"
}

data "template_file" "kubeconfig" {
  template = "${file("${path.module}/config.tpl")}"

  vars {
    cluster_ca_certificate = "${data.google_container_cluster.cluster.master_auth.0.cluster_ca_certificate}"
    endpoint               = "${data.google_container_cluster.cluster.endpoint}"
    location               = "${coalesce(var.zone, var.region)}"
    name                   = "${data.google_container_cluster.cluster.name}"
    project                = "${data.google_container_cluster.cluster.project}"
  }
}

resource "local_file" "kubeconfig" {
  content  = "${data.template_file.kubeconfig.rendered}"
  filename = "${var.kubeconfig}"
}

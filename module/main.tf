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

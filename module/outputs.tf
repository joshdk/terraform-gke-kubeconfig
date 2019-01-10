output "context" {
  description = "The name of the current Kube config context."
  value       = "gke_${data.template_file.kubeconfig.vars.suffix}"
}

output "endpoint" {
  description = "The endpoint of the Kube API server."
  value       = "${data.template_file.kubeconfig.vars.endpoint}"
}

output "kubeconfig" {
  description = "The path of the created Kubernetes client config."
  value       = "${var.kubeconfig}"
}

output "name" {
  description = "The name of the cluster."
  value       = "${var.name}"
}

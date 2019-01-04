variable "kubeconfig" {
  type        = "string"
  description = "The path of the Kubernetes client config file to create."
}

variable "name" {
  type        = "string"
  description = "The name of the cluster."
}

variable "region" {
  type        = "string"
  default     = ""
  description = "The region this cluster has been created in."
}

variable "zone" {
  type        = "string"
  default     = ""
  description = "The zone this cluster has been created in."
}

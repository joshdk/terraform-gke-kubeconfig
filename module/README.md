# Terraform GKE Kubeconfig

📝 Terraform module that creates a Kubeconfig for accessing GKE clusters

## Usage:

```hcl
provider "google" {
  ...
}

module "kubeconfig" {
  source = "github.com/joshdk/terraform-gke-kubeconfig//module"
  name   = "my-cluster"
  zone   = "us-east1-a"
}
```

## Required Inputs

The following input variables are required:

### kubeconfig

Description: The path of the Kubernetes client config file to create.

Type: `string`

### name

Description: The name of the cluster.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### region

Description: The region this cluster has been created in.

Type: `string`

Default: `""`

### zone

Description: The zone this cluster has been created in.

Type: `string`

Default: `""`


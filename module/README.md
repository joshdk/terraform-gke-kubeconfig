# Terraform GKE Kubeconfig

📝 Terraform module that generates a Kubeconfig for accessing GKE clusters

## Usage:

```hcl
provider "google" {
  ...
}

module "kubeconfig" {
  source = "github.com/joshdk/terraform-gke-kubeconfig//module"

  auth_type         = "gcloud"
  gcloud_path       = "/usr/bin/gcloud"
  kubeconfig        = "/tmp/config.yml"
  name              = "my-cluster"
  zone              = "us-east1-a"
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

### auth\_type

Description: The type of cluster auth to use. Must be one of (cert | gcloud | password).

Type: `string`

Default: `"gcloud"`

### gcloud\_path

Description: The path of the gcloud executable.

Type: `string`

Default: `"gcloud"`

### region

Description: The region this cluster has been created in.

Type: `string`

Default: `""`

### zone

Description: The zone this cluster has been created in.

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### context

Description: The name of the current Kube config context.

### endpoint

Description: The endpoint of the Kube API server.

### kubeconfig

Description: The path of the created Kubernetes client config.

### name

Description: The name of the cluster.


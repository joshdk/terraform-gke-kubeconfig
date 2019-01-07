[![CircleCI][circleci-badge]][circleci-link]
[![License][license-badge]][license-link]
[![GitHub release][github-release-badge]][github-release-link]

# Terraform GKE Kubeconfig

📝 Terraform module that creates a Kubeconfig for accessing GKE clusters

## Usage

To use this module, a pre-built [release][github-release-link] version can be sourced.

```hcl
module "kubeconfig" {
  source = "https://github.com/joshdk/terraform-gke-kubeconfig/releases/download/0.1.0/module.tgz"
  ...
}
```

Alternatively, a development version can be sourced instead.

```hcl
module "kubeconfig" {
  source = "github.com/joshdk/terraform-gke-kubeconfig//module"
  ...
}
```

To configure inputs for the module, refer to the bundled [readme](https://github.com/joshdk/terraform-gke-kubeconfig/blob/master/module/README.md).

## License

This code is distributed under the [MIT License][license-link], see [LICENSE.txt][license-file] for more information.

[circleci-badge]:       https://circleci.com/gh/joshdk/terraform-gke-kubeconfig.svg?&style=shield
[circleci-link]:        https://circleci.com/gh/joshdk/terraform-gke-kubeconfig/tree/master
[github-release-badge]: https://img.shields.io/github/release/joshdk/terraform-gke-kubeconfig/all.svg
[github-release-link]:  https://github.com/joshdk/terraform-gke-kubeconfig/releases/latest
[license-badge]:        https://img.shields.io/badge/license-MIT-green.svg
[license-file]:         https://github.com/joshdk/terraform-gke-kubeconfig/blob/master/LICENSE.txt
[license-link]:         https://opensource.org/licenses/MIT

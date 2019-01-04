apiVersion: v1
kind: Config
preferences: {}

current-context: gke_${project}_${location}_${name}

contexts:
  - context:
      cluster: gke_${project}_${location}_${name}
      user: gke_${project}_${location}_${name}
    name: gke_${project}_${location}_${name}

clusters:
  - cluster:
      certificate-authority-data: ${cluster_ca_certificate}
      server: https://${endpoint}
    name: gke_${project}_${location}_${name}

users:
  - name: gke_${project}_${location}_${name}
    user:
      auth-provider:
        config:
          cmd-args: config config-helper --format=json
          cmd-path: gcloud
          expiry-key: '{.credential.token_expiry}'
          token-key: '{.credential.access_token}'
        name: gcp

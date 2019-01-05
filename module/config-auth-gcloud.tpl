  user:
    auth-provider:
      config:
        cmd-args: config config-helper --format=json
        cmd-path: ${gcloud_path}
        expiry-key: '{.credential.token_expiry}'
        token-key: '{.credential.access_token}'
      name: gcp

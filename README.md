# secops-auth

## This is a Terraform code for Cloud Platform with Load Balancing as Reverse Proxy

### [Reference to schema](https://auth0.com/docs/customize/custom-domains/self-managed-certificates/configure-gcp-as-reverse-proxy)

## Use case
### Provisioning a GCP Load Balancer to distribute traffic to a internet NEG that serves auth0 traffic for auth0

`terraform init`

`terrafrom validate`

`export TF_VAR_GOOGLE_PROJECT=<PROJECT_ID>`

`terraform apply`


## The code defines:
-   global network endpoint group
-   global backend service
-   health check
-   URL map
-   target HTTPS proxy
-   global forwarding rule
-   global IP address

### Resources

The `google_compute_global_network_endpoint_group` resource defines a global network endpoint group that represents a load-balancing target group that serves traffic for an FQDN and port. 

The `google_compute_global_network_endpoint` resource defines the default endpoint for the network endpoint group with a specified FQDN and port e.g. `google.com 443`

The `google_compute_url_map` resource maps a URL path to a backend service.

The `google_compute_target_https_proxy` resource defines a target HTTPS proxy that binds the SSL certificate and the URL map to the global forwarding rule.

The `google_compute_global_forwarding_rule` resource defines a global forwarding rule that directs traffic to the target HTTPS proxy.

The `google_compute_global_address` resource defines a global IP address for the load balancer.

SSL cert and key sourced by secret manager

provider "google" {
  project = var.GOOGLE_PROJECT
  region  = var.GOOGLE_REGION
}

# resource internet global network endpoint group
resource "google_compute_global_network_endpoint_group" "internet-neg" {
  name        = "internet-neg"
  network_endpoint_type = "INTERNET_FQDN_PORT"
  default_port = var.PORT
}

resource "google_compute_global_network_endpoint" "default-endpoint" {
  global_network_endpoint_group = google_compute_global_network_endpoint_group.internet-neg.self_link
  fqdn       = var.FQDN
  port       = var.PORT
}

# resource internet global backend service

resource "google_compute_backend_service" "internet-backend-service" {
  name          = "internet-backend-service"
  port_name     = "https"
  protocol      = "HTTPS"
  load_balancing_scheme = "EXTERNAL"
  timeout_sec   = 10
  enable_cdn    = false
  backend {
    group = google_compute_global_network_endpoint_group.internet-neg.self_link

  }
}

resource "google_compute_health_check" "health-check" {
  name               = "health-check"
  check_interval_sec = 1
  timeout_sec        = 1
  healthy_threshold  = 1
  unhealthy_threshold = 1
  https_health_check {
    port = var.PORT
  }
}

resource "google_compute_url_map" "url-map" {
  name            = "url-map"
  default_service = google_compute_backend_service.internet-backend-service.self_link
}

resource "google_compute_target_https_proxy" "target-https-proxy" {
  name        = "target-https-proxy"
  url_map     = google_compute_url_map.url-map.self_link
  ssl_certificates = [google_compute_ssl_certificate.ssl-certificate.self_link]
}

resource "google_compute_global_forwarding_rule" "global-forwarding-rule" {
  name       = "global-forwarding-rule"
  target     = google_compute_target_https_proxy.target-https-proxy.self_link
  port_range = var.PORT
}

resource "google_compute_global_address" "global-address" {
  name = "global-address"
}



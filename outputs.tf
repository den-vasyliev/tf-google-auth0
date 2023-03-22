output "backend-service" {
  value = google_compute_backend_service.internet-backend-service.self_link
}   
output "health-check" {
  value = google_compute_health_check.health-check.self_link
}   
output "url-map" {
  value = google_compute_url_map.url-map.self_link
}   
output "target-http-proxy" {
  value = google_compute_target_https_proxy.target-https-proxy.self_link
}   
output "global-forwarding-rule" {
  value = google_compute_global_forwarding_rule.global-forwarding-rule.self_link
}   
output "ssl-certificate" {
  value = google_compute_ssl_certificate.ssl-certificate.self_link
}   
output "global-address" {
  value = google_compute_global_address.global-address.self_link
}   

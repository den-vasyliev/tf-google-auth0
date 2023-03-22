resource "google_compute_ssl_certificate" "ssl-certificate" {
  name        = var.certificate_name
  private_key = data.google_secret_manager_secret_version.private_key.secret_data
  certificate = data.google_secret_manager_secret_version.certificate.secret_data
}
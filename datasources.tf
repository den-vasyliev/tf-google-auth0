#resource google_compute_ssl_certificate from secret manager 

data "google_secret_manager_secret_version" "private_key" {
  secret   = "projects/${var.GOOGLE_PROJECT}/secrets/${var.private_key_secret}"
}

data "google_secret_manager_secret_version" "certificate" {
  secret   = "projects/${var.GOOGLE_PROJECT}/secrets/${var.certificate_secret}"
}

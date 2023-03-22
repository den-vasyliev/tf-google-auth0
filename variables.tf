variable "GOOGLE_PROJECT" {
  type        = string
  description = "GCP project to use"
}

variable "GOOGLE_REGION" {
  type        = string
  default     = "us-central1-c"
  description = "GCP region to use"
}

variable "certificate_name" {
  description = "name of the certificate"
  default = "auth-ssl-certificate"
}

variable "private_key_secret" {
  description = "value of the private key"
  default = "auth-private-key"
}

variable "certificate_secret" {
  description = "value of the certificate"
  default = "auth-certificate"
}
variable "FQDN" {
  description = "FQDN to use for the NEG "
  default = "www.google.com"
}

variable "PORT" {
  description = "Port to use for the NEG "
  default = "443"
}
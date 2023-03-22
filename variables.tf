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
  default = "auth-ssl-certificate"
}

variable "private_key_secret" {
  default = "auth-private-key"
}

variable "certificate_secret" {
  default = "auth-certificate"
}
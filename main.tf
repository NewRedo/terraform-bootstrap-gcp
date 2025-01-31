terraform {
  required_version = ">= 1.5.7"
}
variable "project" {
  type = string
}
variable "bucket_prefix" {
  type = string
}
variable "bucket_location" {
  type    = string
  default = "europe-west2"
}
variable "storage_class" {
  type    = string
  default = "REGIONAL"
}

provider "google" {
  project = var.project
}

resource "random_uuid" "bucket_suffix" {}

resource "google_storage_bucket" "bucket" {
  name          = "${var.bucket_prefix}-${random_uuid.bucket_suffix.result}"
  location      = var.bucket_location
  storage_class = var.storage_class
  versioning {
    enabled = true
  }
}

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}
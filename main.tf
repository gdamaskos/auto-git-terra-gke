terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.6.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name                        = "${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy               = false
  uniform_bucket_level_access = true
  location                    = "EU"
  storage_class               = "STANDARD"
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket" "gs_sandy_bucket" {
  name                        = "gs-sandy-bucket"
  force_destroy               = false
  uniform_bucket_level_access = true
  location                    = "EU"
  storage_class               = "STANDARD"
  versioning {
    enabled = true
  }
}

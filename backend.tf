terraform {
  backend "gcs" {
    bucket = "a4fda274289ebd93-bucket-tfstate"
    prefix = "terraform/state"
  }
}


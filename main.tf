terraform {
  cloud {
    organization = "fumika-kouzaki-terraform"
    workspaces {
      name = "FUMIKA-boot-camp"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 7.0"
    }
  }
}

provider "google" {
  project = "hc-54dff18a6bd1444cba92b455f3d"
  region  = "us-central1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "test_bucket" {
  name     = "fumika-test-bucket-${random_id.bucket_suffix.hex}"
  location = "US"
  
  uniform_bucket_level_access = true
}

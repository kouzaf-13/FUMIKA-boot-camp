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
      version = "~> 6.0"
    }
  }
}

provider "google" {
  # ここにあなたのGCPプロジェクトIDを正確に入れてください
  project = "hc-54dff18a6bd1444cba92b455f3d" 
  region  = "us-central1"
}

# 練習用のリソース（例：バケットなど、今までの演習で使ったもの）
resource "google_storage_bucket" "test_bucket" {
  name     = "fumika-test-bucket-${random_id.id.hex}"
  location = "US"
}

resource "random_id" "id" {
  byte_length = 4
}

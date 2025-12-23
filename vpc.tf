# VPCの作成
resource "google_compute_network" "my_vpc" {
  # random_string ではなく main.tf で定義した random_id を使うように修正します
  name                    = "fumika-vpc-${random_id.bucket_suffix.hex}"
  auto_create_subnetworks = false
}

# 実行後にURLを表示するための設定
output "vpc_self_link" {
  value = google_compute_network.my_vpc.self_link
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "fumika-subnetwork"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.my_vpc.id
}

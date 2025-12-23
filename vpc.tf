# VPCの作成
resource "google_compute_network" "my_vpc" {
  # ここでExercise 1のランダム文字列を組み合わせて名前を作ります
  name                    = "fumika-${random_string.fumika-random.result}"
  auto_create_subnetworks = false # 演習ではfalseにすることが多いです
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

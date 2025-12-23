provider "google" {

  project = "hc-54dff18a6bd1444cba92b455f3d"

  region  = "us-central1"

}

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

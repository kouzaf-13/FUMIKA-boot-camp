# 1. VM用の新しいランダム文字列 (4〜6文字くらいでOK)
resource "random_string" "vm_suffix" {
  length  = 4
  special = false
  upper   = false
}

# 2. Compute Instance の作成
resource "google_compute_instance" "my_vm" {
  name         = "fumika-vm-${random_string.vm_suffix.result}"
  machine_type = var.machine_type
  zone         = "us-central1-a"

  # Exercise 2で作ったVPCを指定
  network_interface {
    subnetwork = google_compute_subnetwork.my_subnetwork.self_link # ここをsubnetworkに変更
    access_config {} 
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # 後でFirewallルールを適用するためのタグ
  tags = var.vm_tags
}

# 3. インスタンスIDの出力
output "instance_id" {
  value = google_compute_instance.my_vm.instance_id
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-from-iap"
  network = google_compute_network.my_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # 指定されたIAPのIP帯域
  source_ranges = ["35.235.240.0/20"]
  # VM側に付けたタグと同じものを指定
  target_tags   = ["allow-ssh"]
}

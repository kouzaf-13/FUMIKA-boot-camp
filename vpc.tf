resource "google_compute_network" "my_vpc" {
  name                    = "fumika-vpc-${random_id.bucket_suffix.hex}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "fumika-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.my_vpc.id
}

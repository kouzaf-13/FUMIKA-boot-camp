resource "google_compute_network" "my_vpc" {
  name                    = "fumika-vpc-${random_id.bucket_suffix.hex}"
  auto_create_subnetworks = false
}

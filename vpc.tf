resource "google_compute_network" "my_vpc" {
  # random_string ではなく、今 main.tf にある random_id を使うように直します
  name                    = "fumika-vpc-${random_id.bucket_suffix.hex}"
  auto_create_subnetworks = false
}

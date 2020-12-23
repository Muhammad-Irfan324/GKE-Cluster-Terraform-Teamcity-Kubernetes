# AUTHOR - MUHAMMAD IRFAN TAHIR
terraform {
  backend "gcs" {
    bucket = "bucket-addoptify-terraform"
    prefix = "terraform/state"
  }
}

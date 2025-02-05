terraform {
  backend "s3" {
    bucket  = "garnaudov-terraform-state"
    key     = "tta/terraform.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}

terraform {
  backend "s3" {
    bucket = "projeto-iac"
    key    = "Homolog/terraform.tfstate"
    region = "us-east-1"
  }
}

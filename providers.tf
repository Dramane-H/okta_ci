terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "4.15.0"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.94.1"
    }
  }

  backend "s3" {
    bucket         = "atko-okta-terraform-dev-bucket"
    key            = "terraform/state"
    region         = "eu-west-3"
    use_lockfile = true  # Enables native S3 state locking
  }
}

provider "okta" {
  org_name = var.okta_org_name
  base_url = var.okta_base_url
  client_id = var.okta_client_id
  private_key_id = var.okta_private_key_id
  private_key = var.okta_private_key
  okta_secretm  = var.okta_secretm
  okta_scopes = var.okta_scopes
}





provider "aws" {
  # Configuration options
  region = "eu-west-3"
}
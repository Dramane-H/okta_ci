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
}

provider "okta" {
  org_name = "[ORG NAME e.g. dev-123456]"
  base_url = "[okta.com|oktapreview.com]"
  client_id = "[APP CLIENT_ID]"
  private_key_id = "[PRIVATE KEY ID - KID]"
  private_key = "[PRIVATE KEY]"
  scopes = "[COMMA,SEPARATED,SCOPE,VALUES]"
  # Configuration options
}


backend "s3" {
  bucket         = "your-terraform-state-bucket"
  key            = "terraform/state"
  region         = "us-west-2"
  dynamodb_table = "terraform-lock-table"
}


provider "aws" {
  # Configuration options
}
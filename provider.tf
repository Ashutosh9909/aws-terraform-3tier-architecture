# Configuring AWS Provider.
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.57.1"
    }
  }
}

provider "aws" {
  region = var.region_name
  access_key = ""
  secret_key = ""
}

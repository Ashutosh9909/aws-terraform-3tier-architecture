# Configuring AWS Provider.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAQGPM3HQWD33S47LR"
  secret_key = "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"
}
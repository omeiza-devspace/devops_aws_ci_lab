
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

#configure aws provider
provider "aws" {
  region                   = "eu-west-1"
  profile                  = "default"
  shared_credentials_files = ["~/.aws/credentials"]
}
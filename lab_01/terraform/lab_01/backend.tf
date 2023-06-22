locals {
  aws_bucket_name = "devops-directive-tf-state" # REPLACE WITH YOUR BUCKET NAME
  file_directory  = "03-basics/import-bootstrap/terraform.tfstate"
  aws_region      = var.region
  dynamodb_table  = "terraform-state-locking"
  encrypt_data    = true
}


terraform {
  #############################################################
  ## AFTER RUNNING TERRAFORM APPLY (WITH LOCAL BACKEND)
  ## YOU WILL UNCOMMENT THIS CODE THEN RERUN TERRAFORM INIT
  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
  #############################################################

  # store the terraform state file in s3

  # backend "s3" {
  #   bucket         = local.aws_bucket_name
  #   key            = local.file_directory
  #   region         = local.region
  #   dynamodb_table = "dynamodb_table
  #   encrypt        = local.encrypt_data
  # }

  # required_providers {
  #   aws = {
  #     source = "hashicorp/aws"
  #   }
  # }
}

#configure aws provider
# provider "aws" {
#   region                   = var.region
#   profile                  = "default"
#   shared_credentials_files = "~/.aws/credentials"
# }

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "devops-directive-tf-state" # REPLACE WITH YOUR BUCKET NAME
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto_conf" {
  bucket = aws_s3_bucket.terraform_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

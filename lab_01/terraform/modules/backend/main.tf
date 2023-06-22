# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket         = var.s3_bucket_name
    key            = var.document_directory
    region         = var.region
    profile        = var.aws_profile_name
    dynamodb_table = var.dynamodb_table
  }
}
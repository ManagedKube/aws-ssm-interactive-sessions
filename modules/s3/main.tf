terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
  region = var.region
  acl    = var.acl
  # policy = var.policy

  tags = var.tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = var.versioning
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = var.aws_s3_bucket_public_access_block_block_public_acls
  block_public_policy     = var.aws_s3_bucket_public_access_block_block_public_policy
  ignore_public_acls      = var.aws_s3_bucket_public_access_block_ignore_public_acls
  restrict_public_buckets = var.aws_s3_bucket_public_access_block_restrict_public_buckets
}

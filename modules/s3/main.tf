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
  policy = var.policy

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

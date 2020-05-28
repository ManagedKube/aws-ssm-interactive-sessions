output "bucket_name" {
  value = var.bucket_name
}

output "bucket_domain" {
  value = aws_s3_bucket.main.bucket_domain_name
}

output "bucket_id" {
  value = aws_s3_bucket.main.id
}

output "bucket_arn" {
  value = aws_s3_bucket.main.arn
}

# Required
variable "tags" {
  type = map(string)
}

variable "region" {
  description = "AWS region (i.e. us-east-1)"
}

variable "bucket_name" {
  description = "Unique bucket name"
}

# Optional
variable "versioning" {
  description = "Set to true to enable s3 bucket versioning"
  default     = false
}

variable "acl" {
  description = "Canned ACL to use"
  default     = "private"
}

variable "policy" {
  description = "The bucket policy"
  default     = ""
}

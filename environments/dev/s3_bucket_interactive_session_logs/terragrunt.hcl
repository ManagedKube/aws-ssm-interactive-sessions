include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ManagedKube/aws-ssm-interactive-sessions.git//modules/s3?ref=v1.0.0"

}

inputs = {

  region      = "us-east-1"
  #
  # If this bucket name is changed, the S3 resource ARN also needs to be changed to the same string.
  bucket_name = "${get_aws_account_id()}-ssm-session-logs"
  versioning  = "false"

  tags = {
    ops-environment     = "development"
    ops-tier            = "infrastructure"
    ops-subsystem       = "supporting-infrastructure"
    ops-owner           = "engineering"
    ops-name            = "ssm-session-interactive-session-logs"
    ops-method          = "terraform"
    ops-source-repo     = "managedkube/aws-ssm-interactive-sessions"
    ops-source-path     = "modules/s3_bucket_interactive_session_logs/terragrunt.hcl"
  }

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "S3PolicyId1",

  "Statement": [
        {
            "Sid": "Terraform-ssm-session-logs-dev-root-perms",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${get_aws_account_id()}:root"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${get_aws_account_id()}-ssm-session-logs/*"
        }
  ]
}
POLICY
}

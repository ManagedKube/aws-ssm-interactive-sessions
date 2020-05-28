include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com:ManagedKube/aws-ssm-interactive-sessions.git//modules/ec2-role/?ref=v1.0.0"

}

inputs = {
  region = "us-east-1"

  name = "GroupDev"

  s3_bucket_name = "${get_aws_account_id()}-ssm-session-logs-dev"
  s3_bucket_prefix = "dev"

  tags = {
    ops-environment     = "development"
    ops-tier            = "infrastructure"
    ops-subsystem       = "supporting-infrastructure"
    ops-owner           = "engineering"
    ops-name            = "ssm-ec2-instance-role"
    ops-method          = "terraform"
    ops-source-repo     = "managedkube/aws-ssm-interactive-sessions"
    ops-source-path     = "modules/role/terragrunt.hcl"
  }
}

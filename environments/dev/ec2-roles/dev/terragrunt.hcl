include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ManagedKube/aws-ssm-interactive-sessions.git//modules/ec2-role/?ref=v1.0.0"

}

dependency "s3_session_log_bucket" {
  config_path  = "../../s3_bucket_interactive_session_logs"
  mock_outputs = {
    bucket_name = "s3_bucket_123"
  }
}

dependencies {
  paths = [
    "../../s3_bucket_interactive_session_logs"
  ]
}

inputs = {
  region = "us-east-1"

  name = "GroupDev"

  s3_bucket_name = "${dependency.s3_session_log_bucket.outputs.bucket_name}"
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

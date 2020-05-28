include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ManagedKube/aws-ssm-interactive-sessions.git//modules/documents/sessions?ref=v1.0.1"

}

dependency "s3_session_log_bucket" {
  config_path  = "../../../s3_bucket_interactive_session_logs"
  mock_outputs = {
    bucket_name = "s3_bucket_123"
  }
}

dependencies {
  paths = [
    "../../../s3_bucket_interactive_session_logs"
  ]
}

inputs = {

  document_name = "SSM-sudo"

  document_content = <<DOC
  {
  "schemaVersion": "1.0",
  "description": "Document to hold regional settings for Session Manager",
  "sessionType": "Standard_Stream",
  "inputs": {
    "s3BucketName": "${dependency.s3_session_log_bucket.outputs.bucket_name}",
    "s3KeyPrefix": "dev",
    "s3EncryptionEnabled": false,
    "cloudWatchLogGroupName": "",
    "cloudWatchEncryptionEnabled": true,
    "kmsKeyId": "",
    "runAsEnabled": true,
    "runAsDefaultUser": "user-sudo"
  }
}
DOC

  tags = {
    ops-environment     = "development"
    ops-tier            = "infrastructure"
    ops-subsystem       = "supporting-infrastructure"
    ops-owner           = "engineering"
    ops-name            = "ssm-session-user-sudo-dev"
    ops-method          = "terraform"
    ops-source-repo     = "managedkube/aws-ssm-interactive-sessions"
    ops-source-path     = "modules/documents/sessions/user-sudo/terragrunt.hcl"
  }
}

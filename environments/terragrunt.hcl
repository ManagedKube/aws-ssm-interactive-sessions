remote_state {
  backend = "s3"
  config = {
    bucket = "kubernetes-ops-tf-state-${get_aws_account_id()}-terraform-state"

    key = "${path_relative_to_include()}/aws-ssm-interactive-sessions /terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "kubernetes-ops-lock-table"
  }
}

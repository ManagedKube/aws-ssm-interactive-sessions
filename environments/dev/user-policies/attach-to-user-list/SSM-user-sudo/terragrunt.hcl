include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ManagedKube/aws-ssm-interactive-sessions.git//modules/user-policies/attach-policy-to-user?ref=v1.0.0"
}

dependency "ssm_user_sudo" {
  config_path  = "../../restrict-by-ssm-document/SSM-user-sudo"
  mock_outputs = {
    aws_iam_policy_arn = "arn::foo"
  }
}

dependencies {
  paths = [
    "../../restrict-by-ssm-document/SSM-user-sudo",
  ]
}

inputs = {
  user_list = [
      "garland.kan",
  ]

  policy_arn = dependency.ssm_user_sudo.outputs.aws_iam_policy_arn
}

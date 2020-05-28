include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ManagedKube/aws-ssm-interactive-sessions.git//modules/user-policies/restrict-by-ssm-document?ref=v1.0.0"
}

inputs = {

  name = "SSM-user-no-sudo"
  document_name = "SSM-no-sudo"
}

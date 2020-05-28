include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::ssh://git@github.com/ManagedKube/aws-ssm-interactive-sessions.git//modules/vpc-endpoints/?ref=v1.0.1"

}

# dependency "vpc" {
#   config_path  = "../../test-vpc"
#   mock_outputs = {
#     aws_vpc_id = "vpc-123"
#   }
# }

# dependencies {
#   paths = [
#     "../../test-vpc"
#   ]
# }

inputs = {

  region = "us-east-1"

  name = "ssm"

  # aws_vpc_id = dependency.vpc.outputs.aws_vpc_id
  aws_vpc_id = "vpc-0123749cead40433f"

  vpc_endpoint_subnets = ["subnet-0e42246ee21fe97c4", "subnet-0439a74b0a3497fd1", "subnet-05ea0e40733b5c396"]

  tags = {
    ops-environment     = "development"
    ops-tier            = "infrastructure"
    ops-subsystem       = "supporting-infrastructure"
    ops-owner           = "engineering"
    ops-name            = "ssm-session-interactive-session-logs"
    ops-method          = "terraform"
    ops-source-repo     = "managedkube/aws-ssm-interactive-sessions"
    ops-source-path     = "modules/vpc-endpoints/terragrunt.hcl"
  }
}

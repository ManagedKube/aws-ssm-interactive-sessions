variable "role_list" {
  description = "A list of AWS IAM roles"
  type        = list
  default     = []
}

variable "policy_arn" {
  description = "the policy arn to assign to the role_list"
  default     = ""
}

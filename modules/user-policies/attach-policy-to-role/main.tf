resource "aws_iam_role_policy_attachment" "attach" {
  count      = length(var.role_list)
  role      = var.role_list[count.index]
  policy_arn = var.policy_arn
}

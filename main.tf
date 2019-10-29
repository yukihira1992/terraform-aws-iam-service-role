data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    effect = "Allow"
    principals {
      identifiers = var.service_ids
      type = "Service"
    }
  }
}

resource "aws_iam_role" "this" {
  name = var.name
  name_prefix = var.name_prefix
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  force_detach_policies = var.force_detach_policies
  path = var.path
  description = var.description
  max_session_duration = var.max_session_duration
  permissions_boundary = var.permissions_boundary
  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "policies" {
  count = length(var.iam_policy_arns)
  policy_arn = var.iam_policy_arns[count.index]
  role = aws_iam_role.this.name
}

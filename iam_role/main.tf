
locals{
  tagging = {
    env           = var.env,
    availability  = "private",
  }
}
resource "aws_iam_role" "iam_role" {
  name               = var.name
  assume_role_policy = var.assume_role_policy
  tags               = local.tagging
}

resource "aws_iam_instance_profile" "instance_profile" {
  count = var.create_instance_profile ? 1 : 0
  name  = var.name
  role  = aws_iam_role.iam_role.name
}

resource "aws_iam_role_policy" "iam_role_inline_policy" {
  count  = var.associate_inline_policy ? 1 : 0
  name   = var.name
  role   = aws_iam_role.iam_role.name
  policy = var.inline_policy
}


resource "aws_iam_role_policy_attachment" "sto-readonly-role-policy-attach" {
  count      = var.associate_managed_policy ? 1 : 0
  role       = aws_iam_role.iam_role.name
  policy_arn = var.managed_policy_arn
}
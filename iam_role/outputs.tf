output "iam_role_arn" {
  value = aws_iam_role.iam_role.arn
}

output "role_name" {
  value = aws_iam_role.iam_role.name
}

output "instance_profile" {
  value = aws_iam_instance_profile.instance_profile.*.arn
}
output "instance_profile_name" {
  value = aws_iam_instance_profile.instance_profile.*.name
}
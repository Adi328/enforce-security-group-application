resource "aws_s3_bucket" "s3" {
  bucket = var.bucket
  tags = local.tagging
}


resource "aws_config_delivery_channel" "config_delivery_channel" {
  name = "${var.env}-s3_delivery"
  s3_bucket_name =  aws_s3_bucket.s3.bucket
  depends_on     = [aws_config_configuration_recorder.config_configuration_recorder,aws_s3_bucket.s3]

}


resource "aws_config_configuration_recorder" "config_configuration_recorder" {
  role_arn = module.config_assume_role.iam_role_arn

}


resource "aws_config_configuration_recorder_status" "configuration_recorder_status" {
  name       = aws_config_configuration_recorder.config_configuration_recorder.name
  is_enabled = var.is_enabled
  depends_on = [aws_config_delivery_channel.config_delivery_channel]
}

data "aws_iam_policy_document" "assume_role_data" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "role_policy" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetBucketAcl"
    ]
    resources = [
      aws_s3_bucket.s3.arn,
      "${aws_s3_bucket.s3.arn}/*"
    ]
    effect    = "Allow"
  }
}



module "config_assume_role" {
  source = "../iam_role"
  name               = var.config_iam_role_name
  inline_policy      = data.aws_iam_policy_document.role_policy.json
  assume_role_policy = data.aws_iam_policy_document.assume_role_data.json
  associate_managed_policy = true
  managed_policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
  mandatory_tags = local.tagging

}




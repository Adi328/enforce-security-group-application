output "aws_config_s3_bucket" {
  value = aws_config_delivery_channel.config_delivery_channel.s3_bucket_name
}
output "bucket_arn" {
  value = aws_s3_bucket.s3.arn
}
output "bucket_name" {
  value = aws_s3_bucket.s3.bucket
}
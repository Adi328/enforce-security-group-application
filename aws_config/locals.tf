locals{
  bucket_name = "${var.name}-${var.env}-${var.bucket}"
  tagging = {
    env           = var.env,
    availability  = "private"
  }
}
variable "config_iam_role_name" {
  default = "AWSConfigRoleS3WriteLimitedAccess"
  type = string
}

variable "env" {
  type = string
}

variable "is_enabled" {
  type = bool
  default = true
}

variable "bucket" {
  type = string
}


variable "name" {
  type        = string
}
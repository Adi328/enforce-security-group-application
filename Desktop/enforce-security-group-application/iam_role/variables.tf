variable "name" {
  type = string
}
variable "assume_role_policy" {
  type = string
}

variable "inline_policy" {
  type    = string
  default = ""
}

variable "create_instance_profile" {
  type    = bool
  default = false
}

variable "managed_policy_arn" {
  type    = string
  default = ""
}
variable "associate_managed_policy" {
  type    = bool
  default = false
}

variable "mandatory_tags" {
  type = map(string)
}

variable "associate_inline_policy" {
  type = bool
  default = true
}

variable "env" {
  type = string
  default = "prod"

}
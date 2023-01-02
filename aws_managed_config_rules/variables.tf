variable "config_rule_name" {
  type = string
}

variable "config_source_identifier" {
  type = string
  default = "VPC_DEFAULT_SECURITY_GROUP_CLOSED"
}

variable "input_parameters" {
  type    = string
  default = ""
}

variable "owner" {
  type = string
}


variable "env" {
  type = string
}

variable "compliance_resource_types" {
  type = list(string)
}

variable "check_vpc_default_security_group_closed" {
  description = "Enable vpc-default-security-group-closed rule"
  type        = bool
  default     = true
}

variable "check_vpc_sg_open_only_to_authorized_ports" {
  type = bool
  default = true

}
resource "aws_config_config_rule" "vpc_default_security_group_closed" {
  count = var.check_vpc_default_security_group_closed ? 1 : 0

  name = "${var.config_rule_name}_${var.env}"
  description = "Checks that the default security group of any Amazon Virtual Private Cloud (VPC) does not allow inbound or outbound traffic"

  source {
    owner             = var.owner
    source_identifier = var.config_source_identifier
  }
  tags = local.tagging

  scope {
    compliance_resource_types = var.compliance_resource_types
  }

}


resource "aws_config_config_rule" "vpc-sg-open-only-to-authorized-ports" {
  name = "${var.config_rule_name}_${var.env}_vpc-sg-open-only-to-authorized-ports"
  count       = var.check_vpc_sg_open_only_to_authorized_ports ? 1 : 0
  description = "Checks whether any security groups with inbound 0.0.0.0/0 have TCP or UDP ports accessible. The rule is NON_COMPLIANT when a security group with inbound 0.0.0.0/0 has a port accessible which is not specified in the rule parameters. "

  source {
    owner             = var.owner
    source_identifier = var.config_source_identifier
  }
  tags = local.tagging

  scope {
    compliance_resource_types = var.compliance_resource_types
  }

}


config_rule_name = "security"
check_vpc_default_security_group_closed= true
env = "sandbox"
owner ="AWS"

compliance_resource_types = [
  "AWS::EC2::CustomerGateway",
  "AWS::EC2::EIP",
  "AWS::EC2::Host",
  "AWS::EC2::Instance",
  "AWS::EC2::InternetGateway",
  "AWS::EC2::NetworkAcl",
  "AWS::EC2::NetworkInterface",
  "AWS::EC2::RouteTable",
  "AWS::EC2::SecurityGroup",
  "AWS::EC2::Subnet",
  "AWS::CloudTrail::Trail",
  "AWS::EC2::Volume",
  "AWS::EC2::VPC",
  "AWS::EC2::VPNConnection",
  "AWS::EC2::VPNGateway",
  "AWS::EC2::RegisteredHAInstance",
  "AWS::EC2::NatGateway",
  "AWS::EC2::EgressOnlyInternetGateway",
  "AWS::EC2::VPCEndpoint",
  "AWS::EC2::VPCEndpointService",
  "AWS::EC2::FlowLog",
  "AWS::EC2::VPCPeeringConnection"
  ]
module "network_load_balancer" {
  source = "terraform-aws-modules/network-load-balancer/aws"

  name = "ssh-lb"
  internal = true
  subnets = var.subnets

  listener = [
    {
      port = 22
      protocol = "TCP"
    }
  ]

  target_group = [
    {
      port = 22
      protocol = "TCP"
      health_check = {
        protocol = "TCP"
        port = 22
      }
    }
  ]
}

module "autoscaling_group" {
  source = "terraform-aws-modules/autoscaling-group/aws"

  name = "ssh-servers"
  vpc_zone_identifier = var.subnets
  min_size = 1
  max_size = 10
  desired_capacity = 1

  launch_configuration = {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups = var.security_groups
  }

  scaling_policies = {
    scale_out_policy = {
      adjustment_type = "ChangeInCapacity"
      scaling_adjustment = 1
      evaluation_periods = "2"
      metric_name = "CPUUtilization"
      namespace = "AWS/ECS"
      statistic = "SampleCount"
      threshold = "80"
      comparison_operator = "GreaterThanOrEqualToThreshold"
      period = "60"
    }
    scale_in_policy = {
      adjustment_type = "ChangeInCapacity"
      scaling_adjustment = -1
      evaluation_periods = "2"
      metric_name = "CPUUtilization"
      namespace = "AWS/ECS"
      statistic = "SampleCount"
      threshold = "20"
      comparison_operator = "LessThanOrEqualToThreshold"
      period = "60"
    }
  }

  target_group_arns = ["${module.network_load_balancer.target_group_arn}"]
}

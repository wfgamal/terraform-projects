resource "aws_autoscaling_group" "webASG" {
  launch_configuration = aws_launch_configuration.webserverlc.id
  availability_zones   = var.azs
  load_balancers       = [aws_elb.asg-elb.name]
  min_size             = 2
  desired_capacity     = 2
  max_size             = 2
  tag {
    key                 = "Name"
    value               = "Terraform-asg"
    propagate_at_launch = true
  }

}
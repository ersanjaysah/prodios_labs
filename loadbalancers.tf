
# Create an Application Load Balancer
resource "aws_lb" "my_load_balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = [
    aws_subnet.public_subnet.id,
    aws_subnet.private_subnet.id,
  ]
}

resource "aws_lb_target_group" "my_target_group" {
  name        = "my-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.custom_VPC.id
  target_type = "instance"
}

# Create a launch configuration
resource "aws_launch_configuration" "my_launch_config" {
  name          = "my-launch-config"
  image_id      = "ami-010b74bc1a8b29122" # Replace with your AMI ID
  instance_type = "t3.micro"     # Replace with your desired instance type
}

# Create an auto scaling group
resource "aws_autoscaling_group" "my_auto_scaling_group" {
  name                      = "my-auto-scaling-group"
  launch_configuration      = aws_launch_configuration.my_launch_config.name
  vpc_zone_identifier       = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  health_check_type         = "ELB"
  health_check_grace_period = 200

  tag {
    key                 = "Name"
    value               = "my-instance"
    propagate_at_launch = true
  }
  target_group_arns = [aws_lb_target_group.my_target_group.arn]
}



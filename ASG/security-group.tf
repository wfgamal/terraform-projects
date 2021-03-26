resource "aws_security_group" "websg" {
  name = "Allow HTTP-HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrule
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
    }
  }

}
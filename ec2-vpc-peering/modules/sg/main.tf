resource "aws_security_group" "this" {
  name   = var.name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ssh_cidr
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }

  dynamic "ingress" {
    for_each = var.allow_icmp_cidr
    content {
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = var.name }
}

output "sg_id" {
  value = aws_security_group.this.id
}
resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  tags                   = { Name = var.name }
}

output "public_ip" {
  value = try(aws_instance.this.public_ip, "")
}

output "private_ip" {
  value = aws_instance.this.private_ip
}
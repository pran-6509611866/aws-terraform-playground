output "ec2_1_public_ip" {
  value = aws_instance.ec2_1.public_ip
}

output "ec2_1_private_ip" {
  value = aws_instance.ec2_1.private_ip
}

output "ec2_2_private_ip" {
  value = aws_instance.ec2_2.private_ip
}
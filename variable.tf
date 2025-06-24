variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_az" {
  description = "AWS Availability Zone"
  type        = string
  default     = "ap-southeast-1a"
}

variable "vpc1_cidr" {
  description = "CIDR block for VPC 1"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc1_public_subnet" {
  description = "Public subnet in VPC 1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc1_private_subnet" {
  description = "Private subnet in VPC 1"
  type        = string
  default     = "10.0.2.0/24"
}

variable "vpc2_cidr" {
  description = "CIDR block for VPC 2"
  type        = string
  default     = "10.1.0.0/16"
}

variable "vpc2_private_subnet" {
  description = "Private subnet in VPC 2"
  type        = string
  default     = "10.1.1.0/24"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0df7a207adb9748c7"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for EC2 SSH access"
  type        = string
  default     = "id_rsa"
}
variable "region" {
  description = "AWS region"
  default     = "ap-southeast-1"
}

variable "az_1" {
  description = "Availability zone"
  default     = "ap-southeast-1a"
}

variable "ami_id" {
  description = "AMI ID, e.g. Amazon Linux 2"
  type        = string
  default     = "ami-0df7a207adb9748c7" 
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "id_rsa"
}
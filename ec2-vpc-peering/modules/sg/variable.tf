variable "name" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "ssh_cidr" {
  type    = list(string)
  default = []
}
variable "allow_icmp_cidr" {
  type    = list(string)
  default = []
}
variable "name" {
  type = string
}
variable "cidr_block" {
  type = string
}
variable "public_subnet" {
  type = string
  default = ""
}
variable "private_subnet" {
  type = string
}
variable "az" {
  type = string
}
variable "enable_igw" {
  type    = bool
  default = false
}
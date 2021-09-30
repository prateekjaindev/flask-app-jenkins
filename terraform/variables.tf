variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  default = "10.0.10.0/24"
}
variable "avail_zone" {
  default = "ap-south-1a"
}
variable "env_prefix" {
  default = "dev"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "region" {
  default = ap-south-1
}

variable "my_ip" {
  default = "103.208.69.107/32"
}


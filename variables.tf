variable "region" {
default = "us-east-1"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
 
}

variable "instance_type" {
  description = "EC2 instance type"

}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"

}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"

}
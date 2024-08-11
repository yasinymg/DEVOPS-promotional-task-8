variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "eu-west-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "KCVPC"
}

variable "ami" {
  description = "The AMI ID for the instance"
  type        = string
  default     = "ami-0d42bd43968841233"
}

variable "ec2_type" {
  description = "The instance type for the instance"
  type        = string
  default     = "r5.large"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
  default     = "my-key-pair"
}

variable "ec2_name" {
  description = "The name of the instance"
  type        = string
  default     = "minikube-instance"
}

variable "private_key_path" {
  description = "The path to the private key file"
  type        = string
  default     = "~/.ssh/id_rsa"
}

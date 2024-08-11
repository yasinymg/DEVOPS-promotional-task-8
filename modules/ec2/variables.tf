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
  default     = "my-key-pair"  # Update with your key pair name
}

variable "name" {
  description = "The name of the instance"
  type        = string
  default     = "minikube-instance"
}

variable "private_key_path" {
  description = "The path to the private key file"
  type        = string
  default     = "~/.ssh/id_rsa"  # Update with your private key path
}

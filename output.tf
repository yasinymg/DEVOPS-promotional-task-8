output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = module.vpc.vpc_name
}

output "ec2_id" {
  description = "The ID of the ec2"
  value       = module.ec2.instance_id
}

output "instance_public_ip" {
  description = "The public IP of the ec2"
  value       = module.ec2.instance_public_ip
}

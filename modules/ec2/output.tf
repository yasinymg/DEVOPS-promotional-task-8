output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.minikube.id
}

output "instance_public_ip" {
  description = "The public IP of the instance"
  value       = aws_instance.minikube.public_ip
}

output "instance_private_ip" {
  description = "The private IP of the instance"
  value       = aws_instance.minikube.private_ip
}

output "instance_ami" {
  description = "The AMI ID of the instance"
  value       = aws_instance.minikube.ami
}

output "instance_name" {
  description = "The name of the instance"
  value       = aws_instance.minikube.tags["Name"]
}

resource "aws_instance" "minikube" {
  ami           = var.ami
  instance_type = var.ec2_type
  key_name      = var.key_name

  tags = {
    Name = var.name
  }

  provisioner "remote-exec" {
    inline = [
      "curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
      "chmod +x minikube",
      "sudo mv minikube /usr/local/bin/",
      "minikube start --driver=none"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}

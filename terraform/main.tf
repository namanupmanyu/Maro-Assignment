resource "aws_instance" "instance" {
            ami= var.ami
            instance_type= var.instance
            key_name  = var.key
           associate_public_ip_address = true

      tags = {
    Name = "app-instance"
  }
}

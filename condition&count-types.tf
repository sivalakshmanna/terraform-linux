provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "prod" {
  ami           = var.prodami
  instance_type = var.prod-instance
  count         = var.istest == true ? 3 : 0
  tags = {
    Name = "prod-${count.index + 1}"
}
}

resource "aws_instance" "dev" {
  ami           = var.devami
  instance_type = var.dev-instance
  count         = var.istest == false ? 2 : 0
  tags = {
    Name = "dev-${count.index + 1}"
}
}


variable "istest" {
  default = true
}

variable "prod-instance" {
  default = "t2.micro"
}

variable "dev-instance" {
  default = "t2.nano"
}

variable "prodami" {
  default = "ami-0cca134ec43cf708f"
}

variable "devami" {
  default = "ami-0cca134ec43cf708f"
}

output "prod-instance-public-ip" {
  value = aws_instance.prod.*.public_ip
}


output "dev-instance-public-ip" {
  value = aws_instance.dev.*.public_ip
}

terraform.tfvars

istest = true

tags = {
    Name  = "Terraform-${count.index + 1}"
    Batch = "5AM"
  }


####
tags = {
    Name  = var.instance[count.index]---> it gives coustum names
  }

variable "instance"{
   type = list 
   default = [ "dev-instance", "prod-instance", "uat-instance"]
}

tags = {
    Name  =element(var.instance,count.index)---> it gives coustum names
  }

variable "instance"{
   type = list 
   default = [ "dev-instance", "prod-instance", "uat-instance"]
}





provisioner

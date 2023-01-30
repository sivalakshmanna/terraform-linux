resource "aws_instance" "dev" {
  ami           = "ami-074dc0a6f6c764218"
  instance_type = "t2.micro" 
  count         = 3
  tags = {
    Name  = var.instance[count.index]
  }
}


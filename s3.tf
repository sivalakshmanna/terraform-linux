provider "aws" {
  
}
resource "aws_s3_bucket" "terraform" {
  bucket = "terraform-environment-01-23"
  acl    = "public-read"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

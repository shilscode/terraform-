
terraform{
    required_providers {
       aws ={
           source ="hashicorp/aws"
       }
    }
    
}

provider "aws"{
    region ="us-east-1"
    access_key ="AKIAUVYNFGYOORXP3Q7G"
    secret_key ="bgggjKHXvoq19eBW+gexcfWZmhPBjLDdmG+DLXt0"
}

resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = "test"   # Replace with your key pair name
  
  tags = {
    Name = "Shil ec2"
  }
}
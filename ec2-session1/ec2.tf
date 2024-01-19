resource "aws_instance" "Test" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.roboshop-all.id]

  tags = {
    Name = "Naga"
  }
}

resource "aws_security_group" "roboshop-all"{#this is terraform name, for terraform reference only
  name = var.sg-name # this is for AWS
  description = var.sg-description

  ingress {
    description = "Allow all ports"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks
    
  }

  egress {
    from_port = 0
    to_port = 0
    cidr_blocks = var.cidr_blocks
    protocol = "-1"

  }
  tags= {

    Name = "Roboshop-all"

  }
}
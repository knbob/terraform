

resource "aws_security_group" "roboshop-sg" {#this is terraform name, for terraform reference only

    name = var.sg-name # this is for AWS
    description = var.description # this is for AWS
   
   
   ingress {
        description      = "Allow All ports"
        from_port        = var.inbound-from-port # 0 means all ports
        to_port          = 0
        protocol         = "-1"  # to allow from all ports
        cidr_blocks      = var.cidr_blocks
        
    }

    egress {
        from_port        = var.outbound-from-port
        to_port          = 0
        protocol         = "-1" # to allow from all ports
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "roboshop-all-aws"
    }
}

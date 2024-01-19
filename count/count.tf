resource "aws_instance" "test" {
  count = 11
  ami           = var.ami_id
  instance_type = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "mysql" || var.instance_name[count.index] == "shipping" ? "t3.small" : "t2.micro"
  #vpc_security_group_ids  = [aws_security_group.roboshop-all.id] # since security group commented this line also need to be commented

  tags = {
    Name = var.instance_name[count.index]
  }
}

# #---------------------------Security group creation------------------------------------------------
# resource "aws_security_group" "roboshop-all"{#this is terraform name, for terraform reference only
#   name = var.sg-name # this is for AWS
#   description = var.sg-description

#   ingress {
#     description = "Allow all ports"
#     from_port = 0
#     to_port = 0
#     protocol = "tcp"
#     cidr_blocks = var.cidr_blocks
    
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     cidr_blocks = var.cidr_blocks
#     protocol = "-1"

#   }
#   tags= {

#     Name = "Roboshop-all"

#   }
# }

resource "aws_route53_record" "roboshop" {
  count = 11
  #count = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain_name}" #interpolation 
  type    = "A"
  ttl     = 1
  allow_overwrite = true
  records = [var.instance_name[count.index] == "web" ? aws_instance.test[count.index].public_ip : aws_instance.test[count.index].private_ip]

}

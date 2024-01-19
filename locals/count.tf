resource "aws_instance" "web" {
  #count = 11 # count.index is a special variable given by terraform
  count = length(var.instance_names)
  ami           = var.ami_id #devops-practice
  instance_type = local.instance_type
  tags = {
    Name = var.instance_names[count.index]
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

# resource "aws_route53_record" "roboshop" {
#   count = 11
#   #count = length(var.instance_names)
#   zone_id = var.zone_id
#   name    = "${var.instance_name[count.index]}.${var.domain_name}" #interpolation 
#   type    = "A"
#   ttl     = 1
#   allow_overwrite = true
#   records = [var.instance_name[count.index] == "web" ? aws_instance.test[count.index].public_ip : aws_instance.test[count.index].private_ip]

# }

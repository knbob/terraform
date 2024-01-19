resource "aws_instance" "test" {
  for_each = var.instance_name
  ami           = var.ami_id
  instance_type = each.value
  #vpc_security_group_ids  = [aws_security_group.roboshop-all.id] # since security group commented this line also need to be commented

  tags = {
    Name = each.key
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
  #count = 11
  #count = length(var.instance_names)
  for_each = aws_instance.test
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #interpolation 
  type    = "A"
  ttl     = 1
  allow_overwrite = true
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]

}

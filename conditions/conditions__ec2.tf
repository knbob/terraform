resource "aws_instance" "naga" {
    ami = var.ami_id
    instance_type = var.instance-name == "Mongodb" ? "t3.small" : "t2.micro"
    tags = var.tags
    vpc_security_group_ids = [aws_security_group.roboshop-sg.id]
}

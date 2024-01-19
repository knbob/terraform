variable "sg-name" {
    type = string
    default = "roboshop-all-aws"
  
}

variable "sg-description" {
    type = string
    default = "Allow all inbound traffic"  
}

variable "inbound-from-port" {
   # type = string
    default = 0 
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]  
}

variable "instance_name" {
    type = map
    default = {
        mongodb = "t3.small"
        mysql = "t3.small"
        redis = "t2.micro"
        rabbitmq = "t2.micro"
        user = "t2.micro"
        cart = "t2.micro"
        catalogue = "t2.micro"
        payment = "t2.micro"
        dispatch = "t2.micro"
        web = "t2.micro"
        shipping = "t3.small"   
    }
        
  
}

variable "zone_id" {
    type = string
    default = "Z08178632CFH6K6LABWUB"
  
}

variable "domain_name" {
    type = string
    default = "knbob.online"

}

variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"
  
}
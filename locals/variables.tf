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

variable "instance_names" {
    type = list
    default = ["mongodb","mysql","redis","rabbitmq","user","cart","catalogue","payment","dispatch","web","shipping"]   
  
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

variable "tags" {
    type = string
    default = "web"
  
}

variable "is_prod" {
    type = bool
    default = false
  
}
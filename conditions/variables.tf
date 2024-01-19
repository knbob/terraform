
variable "instance-name" {
    type = string
    default = "Mongodb"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb"  

}

variable "tags" {
    type = map
    default = {
        Name = "terraform_instance"
        ENV = "Dev"
        Project = "Roboshop"
        Terraform = "True"
        Instance = "Web"
    }
  
}

variable "sg-name" {

    type = string
    default = "Allow-all-ports" # this is for AWS
      
}

variable "description" {
    
    type = string
    default = "This sg will allow all ports" # this is for AWS
  
}

variable "inbound-from-port"{
    type = number
    default = 0
}

variable "outbound-from-port"{
    type = number
    default = 0
}

variable "cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
  
}
locals {
  
  name = "nagababu"
  training = "terraform"
  instance_type = var.is_prod == "True"? "t3.micro":"t2.small"

}
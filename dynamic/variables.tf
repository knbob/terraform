variable "inbound_ports" {
    type = list
    default = ["443","80","22"]
   
  
}

variable "outbound_ports" {
    type = list
    default =   ["443","80"]
    
  
}
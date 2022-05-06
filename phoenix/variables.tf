variable "prefix" {
  type = string
  default = "Demo"
}

variable "region" {
    
}

variable "env" {
    type = string
    description = "This is the environment name"
    default = "dev"
}

variable "owner" {

  type = string
  default = "phoenix-IT"
}


variable "VPC_CIDR" {
    description = "This is the CIDR or IP Address range for the VPC" 
    type = string
    default = "10.0.0.0/24"
}

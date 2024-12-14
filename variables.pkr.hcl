
variable "project_name" {
  type = string
  default = "zomato"
}

variable "project_env" {
  type = string
  default = "prod"
}


variable "ami" {
  type = string
  default = "ami-0614680123427b75e"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

locals {
  
  timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
  image_name = "${var.project_name}-${var.project_env}-${local.timestamp}"
}


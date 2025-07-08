variable "ami"{
  description="Linux ami"
  type = string
  default = "ami-05ffe3c48a9991133"
}
variable "instance_type"{
  description="Set the instance type"
  type = string
  default = "t2.micro"
}

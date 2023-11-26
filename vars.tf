variable "REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    ami = "0fc5d935ebf8bc3bc"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "MYIP" {
  default = "0.0.0.0/32"
}
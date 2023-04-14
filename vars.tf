variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}


variable "ZONE2" {
  default = "us-east-2b"
}


variable "ZONE3" {
  default = "us-east-2c"
}




variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0557a15b87f6559cf"
    us-east-2 = "ami-00eeedc4036573771"
  }
}

variable "USER" {
  default = "ubuntu"
}

variable "PUB_KEY" {
  default = "devkey-02.pub"
}

variable "PRIV_KEY" {
  default = "devkey-02"
}

variable "MYIP" {
  default = "49.204.179.208/32"
}

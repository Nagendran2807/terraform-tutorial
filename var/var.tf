resource "random_pet" "other-pet" {
  prefix = "Mr"
  length = "2"
  separator = "."
}


variable "prefix" {
  default = ["apple", "banana"]
  type=list(string)
}


variable "users" {
  type = set(string)
  default = ["tom", "jerry", "pluto", "daffy", "tom", "jerry"]
}

variable "userslist" {
  type = list(string)
  default = ["tom", "jerry", "pluto", "daffy", "tom", "jerry"]
}


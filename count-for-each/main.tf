/*
resource "local_file" "cars" {
  filename = var.filename
  count = 3
  #content = "My fav pet is ${random_pet.my-pet.id}"
  # depends_on = [ random_pet.my-pet.id ]
}

##### variable section #####
variable "filename" {
  default = [
      "nissan.txt",
      "bmw.txt",
      "kia.txt"
  ]
  type = list(string)
}
*/

/*
resource "local_file" "test" {
  filename = var.filename[count.index]
  count = 3
  #count = length(var.filename)
}
variable "filename" {
  default = [
      "nissan.txt",
      "bmw.txt",
      "kia.txt"
  ]
  type = list(string)
}
*/

/*
# For each 
resource "local_file" "test" {
  filename = each.value
  for_each = var.filename
}

variable "filename" {
  default = [
      "nissan.txt",
      "bmw.txt",
      "kia.txt"
  ]
  type = list(string)
}

*/

/*
# First trype 
resource "local_file" "test" {
  filename = each.value
  for_each = var.filename
}

variable "filename" {
  default = [
      "nissan.txt",
      "bmw.txt",
      "kia.txt"
  ]
  type = set(string)
}

*/

/*
# Second trype 
resource "local_file" "test" {
  filename = each.value
  for_each = toset(var.filename)
}

variable "filename" {
  default = [
      "nissan.txt",
      "bmw.txt",
      "kia.txt"
  ]
  type = list(string)
}

*/
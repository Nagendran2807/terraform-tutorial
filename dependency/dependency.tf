
##### Implicit dependency ######
resource "local_file" "pet" {
  filename = var.filename
  #content = "My fav pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-pet" {
  prefix = var.prefix 
  separator = var.seperator
  length = var.length
}

/*
output "pet-id" {
  pet-name = random_pet.my-pet.id
  description = "Diaply pet name"
}
*/

### variable section #######
variable "filename" {
  default = "pet.txt"
}

variable "prefix" {
  default = "Mr"
}

variable "seperator" {
  default = "-"
}

variable "length" {
  default = 5
}

/*
##### Explicit dependency #######
resource "local_file" "pet" {
  filename = var.filename
  depends_on = [ random_pet.my-pet.id ]
}

resource "random_pet" "my-pet" {
  prefix = var.prefix 
  seperator = var.seperator
  length = var.length
}
*/
resource "local_file" "testing" {
  filename = var.filename
  content = "DevOps World"
}


##### variable section #####
variable "filename" {
  default = "test.txt"
  type = string
}

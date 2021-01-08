resource "local_file" "jedi" {
     filename = var.jedi["filename"]
     content = var.jedi["content"]
}

variable "jedi" {
  type = map(string)
  default = {
    "filename" = "test.txt"
    "content" = "DevOps World"
  }
}

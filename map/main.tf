resource "local_file" "test" {
     filename = var.file["filename"]
     content = var.file["content"]
}

variable "file" {
  type = map(string)
  default = {
    "filename" = "test.txt"
    "content" = "DevOps World"
  }
}

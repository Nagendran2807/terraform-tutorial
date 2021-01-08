resource "local_file" "jedi" {
     filename = var.filename
     content = "welcome everyone"
}

variable "filename" {
  type = string
  default = "test.txt"  
}

# export TF_VAR_filename = "test-env-var.txt"
# -var "filename="test-runtime-var.txt"
/*
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "1.4.0"
    }
  }
}
*/
resource "local_file" "test" {
  filename = "test.txt"
}


# other options 
# version = "!= 1.4.0"
# version = "< 1.4.0, > 1.2.0, != 1.4.0"
# version = "~> 1.2.0" ---> pessimistic constraint operator ----> check the version incremental goes from 1.2.0 to 1.2.10 but not 1.3.0 


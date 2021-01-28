resource "local_file" "pet" {
    filename = "petx.txt"
    content = "we love pets"
    #file_permission = "0600"
  
  lifecycle {
    # create_before_destroy = true 
    # ignore_changes = [ filename, content ]
    # ignore_changes = all
    prevent_destroy = true
  }

}

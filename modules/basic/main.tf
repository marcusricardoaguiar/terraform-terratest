# ---------------------------------------------------------------------------------------------------------------------
# BASIC TERRAFORM EXAMPLE
# See test/terraform_aws_example.go for how to write automated tests for this code.
# ---------------------------------------------------------------------------------------------------------------------

resource "local_file" "example" {
  content  = "${var.example} + ${var.example2}"
  filename = "example.txt"
}

resource "local_file" "example2" {
  content  = var.example2
  filename = "example2.txt"
}

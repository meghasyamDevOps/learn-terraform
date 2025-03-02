variable "my_variable" {}
variable "my_variable1" {}

output "variable" {
  value = var.my_variable
}

output "variable1" {
  value = var.my_variable1
}

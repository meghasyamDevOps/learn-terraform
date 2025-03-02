# without default we can assign value using -var flag
variable "my_variable" {}

output "variable" {
  value = var.my_variable
}
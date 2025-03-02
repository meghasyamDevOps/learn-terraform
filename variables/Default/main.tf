# This is variable we assign value in default
variable "default_my_variable" {
  default = "_default_variable"
}

output "variable" {
  value = var.default_my_variable
}
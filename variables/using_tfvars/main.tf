variable "my_variable" {}
variable "my_variable1" {}
variable "my_variable2" {}

output "variable" {
  value = var.my_variable
}

output "variable1" {
  value = var.my_variable1
}

output "variable2" {
  value = var.my_variable2
}

######
# NOTE
######

# 1. terraform.tfvars file will be automatically detected by terraform
# 2. without terraform.tfvars file explicit we want to tell terraform which ".tfvars" file we are using by "-var-file=<path>" flag
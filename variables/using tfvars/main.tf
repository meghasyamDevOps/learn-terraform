variable "my_variable" {}

output "variable" {
  value = var.my_variable
}

######
# NOTE
######

# 1. terraform.tfvars file will be automatically detected by terraform
# 2. without terraform.tfvars file explicit we want to tell terraform which ".tfvars" file we are using by "-var-file=<path>" flag
# state.tf
terraform {
  backend "s3" {
    bucket = "megha-aws-terraform"
    key    = "roboshop/practice/terraform.tfstate"
    region = "us-east-1"
  }
}

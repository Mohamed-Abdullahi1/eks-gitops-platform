locals {
  name   = "eks-Lab"
  domain = "lab.moabdullahi.uk"
  region = "eu-west-2"

  tags = {
    Enviroment = "sandbox"
    Project    = "EKS Advanced Lab"
    Owner      = "Mo"
  }
}
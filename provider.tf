# Configure Terraform providers
terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "15.11.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }


  backend "s3" {
    bucket = "terraformstate"
    key    = "private"
    region = "us-east-1"
  }

}

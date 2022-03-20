terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=2.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # change to your region
  profile = "github" # change to your profile name
}

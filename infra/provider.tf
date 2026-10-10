terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "ecs-proj-s3-bucket"
    key          = "ecs-gatus/app/terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
  }
}
# Configure the AWS Provider
provider "aws" {
  region = var.region
}

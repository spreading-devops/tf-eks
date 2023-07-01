terraform {
  backend "s3" {
    bucket         = "dev-matheuscarino-vpc-terraform-state"
    key            = "dev-matheuscarino-vpc.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-matheuscarino-vpc-terraform-state-lock-dynamodb"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.6.2"
    }
  }
  required_version = "~> 1.5.2"
}

provider "aws" {
  region = "us-east-1"
}

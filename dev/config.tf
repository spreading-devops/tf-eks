terraform {
  backend "s3" {
    bucket         = "dev-matheuscarino-terraform-state"
    key            = "dev-matheuscarino.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dev-matheuscarino-terraform-state-lock-dynamodb"
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


data "aws_ssm_parameter" "workers_ami_id" {
  name            = "/aws/service/eks/optimized-ami/1.27/amazon-linux-2/recommended/image_id"
  with_decryption = false
}

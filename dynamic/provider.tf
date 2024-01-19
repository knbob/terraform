terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0" # aws provider version
    }
  }
  backend "s3" {
    bucket         = "knbob-bucket"
    key            = "foreach"
    region         = "us-east-1"
    dynamodb_table = "knbob-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}
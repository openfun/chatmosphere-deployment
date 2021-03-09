terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    key             = "chatmosphere.tfstate"
    encrypt         = true
    bucket          = "chatmosphere-terraform"
    dynamodb_table  = "chatmosphere_state_locks"
  }
}

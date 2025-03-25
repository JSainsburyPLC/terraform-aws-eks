terraform {
  required_version = ">= 0.12.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.52.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1.2"
    }
  }
}

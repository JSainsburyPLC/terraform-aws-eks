terraform {
  required_version = ">= 0.12.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.52.0"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.1"
    }
  }
}

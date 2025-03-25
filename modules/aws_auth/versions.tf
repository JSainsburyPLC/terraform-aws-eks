terraform {
  required_version = ">= 0.12.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.52.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.1"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 1.6.2"
    }
  }
}

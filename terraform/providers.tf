terraform {
  required_providers {
    aws = {
      source  = "hc-registry.website.cloud.croc.ru/c2devel/croccloud"
      version = "4.14.0-CROC7"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }

}

provider "aws" {
  endpoints {
    ec2 = "https://api.cloud.croc.ru"
  }
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_region_validation      = true

  insecure = false

  region     = "croc"
  access_key = var.cc_access_key
  secret_key = var.cc_secret_key
}

terraform {
    required_version = ">= 0.12.24"
}

provider "aws" {
    region = "us-east-2"
    version = "~> 2.63"
}

provider "random" {
    version = "~> 2.2"
}
module "atlantis" {
    source = "ringanta/ec2-atlantis/aws"
    version = "1.0.0"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDx3/p+qAZI4xhpgejS0I4RanltIDPyDUEy+e0/FFvzZuzT4yosUreBTyHOjbpwC4gH/5yfv/+xDLj4WEG8fo+Cc5PaM/s39k1AfwFp0Y/lMFu8q908rQHUTGIqFqnwcOZB8HN9iAiF5lbahVWuI9D774xoR87hWSQI+5LyEs0SJ5qD5kzmGx069xXIhEMe/Dk0/c1DtrCOLtrghy9NhGOacorDsloK5PEZjYEzJOhzYFXs8H3y/wPvMuNNiBNehcG3OlyHS68q5RMP1Pvv5OTlOszAenkGjdfaRBP1xGP9D1truQrNOewNzNbknOvivKew3qiW2+TWoemMtILygFzT jefersonbernal@Jefersons-MacBook-Pro.local"
    attach_admin_policy = true
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-s3-backend-atlantis2"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
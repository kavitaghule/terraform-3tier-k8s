provider "aws" {
    region = "ap-south-1"
    secret_key = data.vault_generic_secret.aws.data["secret_key"]
    access_key = data.vault_generic_secret.aws.data["access_key"]
}
provider "aws" {
  region                      = var.region
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    iam = "http://localhost:4566"
    rds = "http://localhost:4566"
    eks = "http://localhost:4566"
    sts = "http://localhost:4566"
  }
}

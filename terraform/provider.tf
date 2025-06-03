provider "aws" {
    region = "ap-south-1"
    secret_key = data.vault_generic_secret.aws.data["secret_key"]
    access_key = data.vault_generic_secret.aws.data["access_key"]
}
terraform {
  backend "s3" {
    bucket  = "example-bucket-mamata-terraform"
    key     = "dev/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
    # use_lockfile = true
  }
}

terraform {
  backend "s3" {
    bucket         = "mysql-backup-tool-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

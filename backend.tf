terraform {
backend "s3" {
bucket = "terraform-project-backend-2020"
key = "tower/us-east-1/tools/virginia/new-tower.tfstate"
region = "us-east-1"
dynamodb_table = "terraform-team1"
  }
}
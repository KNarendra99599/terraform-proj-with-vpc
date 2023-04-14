terraform {
  backend "s3" {
    bucket = "terraform-backend-new-dev1"
    key    = "dev-backend/backend-proj-2"
    region = "us-east-2"
  }
}

terraform {
  backend "s3" {
    region         = "eu-central-1"
    bucket         = "adaptavist-tf-state"
    key            = "task-4.tfstate"
    dynamodb_table = "task-4-state-lock"
    encrypt        = true
  }
}

# Note: variables are not allowed here

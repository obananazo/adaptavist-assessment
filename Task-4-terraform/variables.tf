# --- General ---
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1"
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(string)
  default = {
    Project     = "adaptavist-assessment"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}

# --- TF State ---
variable "terraform_state_bucket" {
  description = "The S3 bucket to store Terraform state"
  type        = string
  default     = "my-terraform-state-bucket"
}

# --- VPC ---
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# --- Network ---
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

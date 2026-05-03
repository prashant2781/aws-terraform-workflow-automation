provider "aws" {
  region = "ap-south-1"

  default_tags {
    tags = {
      Project     = "workflow-automation-lab"
      Environment = "dev"
      ManagedBy   = "terraform"
      Owner       = "prashant"
    }
  }
}

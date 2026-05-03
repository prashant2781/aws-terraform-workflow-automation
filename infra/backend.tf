terraform {
  backend "s3" {
    bucket       = "ps-tf-state-628479575897-ap-south-1"
    key          = "workflow-automation/dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}

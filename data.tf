data "aws_region" "current" {}

data "aws_vpc" "main" {
  default = true
}

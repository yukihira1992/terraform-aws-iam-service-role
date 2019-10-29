provider "aws" {
  region = var.region
}

module "this" {
  source = "../"

  name = "service-role-for-lambda"
  service_ids = [
    "lambda.amazonaws.com",
  ]
  iam_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
  ]

  tags = {
    Environment = "dev"
  }
}

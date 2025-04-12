provider "aws" {
  # Configuration options
  region = "eu-west-3"
}

resource "aws_secretsmanager_secret" "example" {
  name = var.okta_secretm
}

data "aws_iam_policy_document" "example" {
  statement {
    sid    = "AllowS3Access"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::atko-okta-terraform-dev-bucket"
    ]
  }

  statement {
    sid    = "AllowS3ObjectAccess"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]

    resources = [
      "arn:aws:s3:::atko-okta-terraform-dev-bucket/*"
    ]
  }

  statement {
    sid    = "AllowSecretsManagerAccess"
    effect = "Allow"

    actions = [
      "secretsmanager:ListSecrets",
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      aws_secretsmanager_secret.example.arn
    ]

  }
}


  resource "aws_secretsmanager_secret_policy" "example" {
    secret_arn = aws_secretsmanager_secret.example.arn
    policy     = data.aws_iam_policy_document.example.json
  }


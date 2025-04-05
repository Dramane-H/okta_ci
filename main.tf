resource "aws_secretsmanager_secret" "example" {
  name = "example"
}

data "aws_iam_policy_document" "example" {
  statement {
    sid    = "AllowS3Access"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::<S3-Bucket-Name>"
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
      "arn:aws:s3:::<S3-Bucket-Name>/*"
    ]
  }

  statement {
    sid    = "AllowDynamoDBAccess"
    effect = "Allow"

    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem"
    ]

    resources = [
      "arn:aws:dynamodb:<AWS-Region>:<Account-ID>:table/<DynamoDB-Table-Name>"
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

resource "aws_dynamodb_table" "state_lock_table" {
  name           = "atko-okta-terraform-dev"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
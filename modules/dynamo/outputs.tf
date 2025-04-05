output "dynamo" {
  value = aws_dynamodb_table.state_lock_table.attribute
}
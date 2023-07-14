output "arn" {
  description = "The cloudwatch log group ARN"
  value       = aws_cloudwatch_log_group.main.arn
}

output "name" {
  description = "The cloudwatch log group name"
  value       = aws_cloudwatch_log_group.main.name
}

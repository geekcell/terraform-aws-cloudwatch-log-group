output "name" {
  description = "The cloudwatch log group name"
  value       = aws_cloudwatch_log_group.main.name
}

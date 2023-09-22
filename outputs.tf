output "arn" {
  description = "The cloudwatch log group ARN"
  value       = aws_cloudwatch_log_group.main.arn
}

output "name" {
  description = "The cloudwatch log group name"
  value       = aws_cloudwatch_log_group.main.name
}

output "customer_managed_key_arn" {
  description = "The ARN of the customer KMS key used to encrypt log data if enabled."
  value       = var.enable_customer_managed_kms ? module.kms[0].key_arn : null
}

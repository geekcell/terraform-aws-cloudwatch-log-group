# Context
variable "tags" {
  description = "Tags to add to the AWS Cloudwatch log group."
  default     = {}
  type        = map(any)
}

# AWS Cloudwatch log groups
variable "name" {
  description = "The name of the log group."
  type        = string
}

variable "retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group."
  default     = 30
  type        = number
}

variable "skip_destroy" {
  description = "Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state."
  default     = false
  type        = bool
}

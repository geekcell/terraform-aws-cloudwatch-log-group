/**
 * # Terraform Cloudwatch Log Group
 *
 * Terraform module which creates an AWS Cloudwatch Log group. The focus on this module lies within it's simplicity by
 * providing default values that should make sense for most use cases.
 */
resource "aws_cloudwatch_log_group" "main" {
  name = var.name

  retention_in_days = var.retention_in_days
  skip_destroy      = var.skip_destroy
  kms_key_id        = module.kms.key_arn

  tags = var.tags
}

resource "aws_cloudwatch_log_stream" "main" {
  name = var.name

  log_group_name = aws_cloudwatch_log_group.main.name
}

module "kms" {
  source  = "geekcell/kms/aws"
  version = ">= 1.0.0, < 2.0.0"

  alias  = format("cloudwatch/%s", var.name)
  policy = data.aws_iam_policy_document.main.json
}

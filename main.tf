/**
 * # Terraform Cloudwatch Log Group
 *
 * Terraform module which creates an AWS Cloudwatch Log group.
 * The focus on this module lies within it's simplicity by providing default values
 * that should make sense for most use cases.
 */
resource "aws_cloudwatch_log_group" "main" {
  name = var.name

  kms_key_id        = module.kms.key_arn
  retention_in_days = var.retention_in_days
  skip_destroy      = var.skip_destroy

  tags = var.tags
}

resource "aws_cloudwatch_log_stream" "main" {
  name = var.name

  log_group_name = aws_cloudwatch_log_group.main.name
}

module "kms" {
  source = "github.com/geekcell/terraform-aws-kms"

  alias  = format("cloudwatch/%s", var.name)
  policy = data.aws_iam_policy_document.main.json
}

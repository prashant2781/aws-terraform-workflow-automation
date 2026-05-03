resource "aws_sqs_queue" "workflow_dlq" {
  name                      = "workflow-automation-dlq-dev"
  message_retention_seconds = 1209600

  sqs_managed_sse_enabled = true

  tags = {
    Name = "workflow-automation-dlq-dev"
  }
}

#######################################
# EventBridge Rule
# Triggers Step Functions on OrderCreated
#######################################

resource "aws_cloudwatch_event_rule" "order_created_rule" {
  name        = "workflow-order-created-rule"
  description = "Trigger Step Function when order is created"

  event_pattern = jsonencode({
    source      = ["myapp.orders"]
    detail-type = ["OrderCreated"]
  })
}

#######################################
# EventBridge Target (Step Functions)
#######################################

resource "aws_cloudwatch_event_target" "order_created_target" {
  rule      = aws_cloudwatch_event_rule.order_created_rule.name
  target_id = "StepFunctionTarget"
  arn       = aws_sfn_state_machine.order_workflow.arn
  role_arn  = aws_iam_role.eventbridge_role.arn
}

resource "aws_sfn_state_machine" "order_workflow" {
  name     = "workflow-order-state-machine"
  role_arn = aws_iam_role.stepfunctions_execution_role.arn

  definition = jsonencode({
    Comment = "Order processing workflow"
    StartAt = "ValidateOrder"
    States = {
      ValidateOrder = {
        Type     = "Task"
        Resource = "arn:aws:states:::lambda:invoke"
        Parameters = {
          FunctionName = aws_lambda_function.validate_order.function_name
          "Payload.$"  = "$"
        }
        Retry = [{
          ErrorEquals     = ["States.ALL"]
          IntervalSeconds = 2
          MaxAttempts     = 2
        }]
        Catch = [{
          ErrorEquals = ["States.ALL"]
          ResultPath  = "$.error"
          Next        = "FailState"
        }]
        End = true
      }
      FailState = {
        Type = "Fail"
      }
    }
  })
}

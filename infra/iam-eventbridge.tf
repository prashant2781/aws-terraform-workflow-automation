#######################################
# EventBridge Execution Role
#######################################

resource "aws_iam_role" "eventbridge_role" {
  name = "workflow-eventbridge-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "events.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

#######################################
# Allow EventBridge to start Step Function
#######################################

resource "aws_iam_role_policy_attachment" "eventbridge_stepfunctions" {
  role       = aws_iam_role.eventbridge_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSStepFunctionsFullAccess"
}

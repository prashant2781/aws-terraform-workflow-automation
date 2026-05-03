#######################################
# Lambda Execution Role
#######################################

resource "aws_iam_role" "lambda_execution_role" {
  name = "workflow-lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# ✅ Correct Lambda logging policy
resource "aws_iam_role_policy_attachment" "lambda_basic_logs" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# ✅ DynamoDB access (learning phase)
resource "aws_iam_role_policy_attachment" "lambda_dynamodb" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

# ✅ SQS access for DLQ
resource "aws_iam_role_policy_attachment" "lambda_sqs" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

#######################################
# Step Functions Execution Role
#######################################

resource "aws_iam_role" "stepfunctions_execution_role" {
  name = "workflow-stepfunctions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "states.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# ✅ Correct Step Functions service policy
resource "aws_iam_role_policy_attachment" "stepfunctions_service" {
  role       = aws_iam_role.stepfunctions_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSStepFunctionsFullAccess"
}


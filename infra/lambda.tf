data "archive_file" "validate_order_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/validate_order.py"
  output_path = "${path.module}/lambda/validate_order.zip"
}

resource "aws_lambda_function" "validate_order" {
  function_name = "workflow-validate-order"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "validate_order.lambda_handler"
  runtime       = "python3.10"
  timeout       = 10

  filename         = data.archive_file.validate_order_zip.output_path
  source_code_hash = data.archive_file.validate_order_zip.output_base64sha256

  environment {
    variables = {
      ENV = "dev"
    }
  }
}

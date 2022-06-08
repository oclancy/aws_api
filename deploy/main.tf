data "aws_iam_role" "iam_for_lambda" {
  name = "AWSLambdaBasicExecutionRole"
}



resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "${var.lambda_function_name}.zip"
  function_name = var.lambda_function_name
  role          = data.aws_iam_role.iam_for_lambda.arn
  handler       = "${var.lambda_function_name}.Function.FunctionHandler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("${var.lambda_function_name}.zip")

  runtime = "dotnet6"


}

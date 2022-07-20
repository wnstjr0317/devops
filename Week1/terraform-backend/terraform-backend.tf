resource "aws_s3_bucket" "test-s3-tf-state" {

  bucket = "<생성할 S3 Bucket명>"

  tags = {
    "Name" = "<구분할 임의의 S3 Bucket Tag명>"
  }
  
}

resource "aws_dynamodb_table" "test-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.test-s3-tf-state]
  name         = "<생성할 DynamoDB Table명>"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "<구분할 임의의 DynamoDB Tag명>"
  }

}
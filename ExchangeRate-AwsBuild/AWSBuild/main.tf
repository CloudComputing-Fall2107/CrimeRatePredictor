provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-2"
}

resource "aws_s3_bucket" "b"{
  bucket = "${var.aws_s3_bucket}"
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.aws_table_name}"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "DateOrdinal"
  range_key      = "ExchangeRate"

  attribute {
    name = "DateOrdinal"
    type = "N"
  }

  attribute {
    name = "ExchangeRate"
    type = "N"
  }
}
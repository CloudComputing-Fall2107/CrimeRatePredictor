variable "aws_access_key"{
    default = "*"
}
variable "aws_secret_key"{
     default = "*"
}
variable "aws_region"{
    default = "us-east-2"   
}
variable "aws_s3_bucket"{
    default = "exchange.rate.predictor.model"
}
variable "aws_table_name"{
    default = "exchange_dynamo_table"
}
terraform {
    backend "s3" {
        bucket = "globalstate-exchangeratepredictor"
        key = "terraform.tfstate"
        region = "us-east-2"
        access_key = "AKIAIF2QZ2ATL3Y5NP4Q"
        secret_key = "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"
        encrypt = "true"
    }
} 
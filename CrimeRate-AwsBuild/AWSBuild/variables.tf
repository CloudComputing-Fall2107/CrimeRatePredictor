variable "aws_access_key"{
}
variable "aws_secret_key"{
}
variable "aws_region"{ 
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
        encrypt = "true"
    }
} 
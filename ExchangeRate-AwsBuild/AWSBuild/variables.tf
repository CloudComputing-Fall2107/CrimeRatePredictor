variable "aws_access_key"{
    default = "AKIAJRIDH2KRTGFDI7GQ"
}
variable "aws_secret_key"{
     default = "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"
}
variable "aws_region"{
    default = "us-east-2"   
}
variable "aws_s3_bucket"{
    default = "exchange.rate.predictor.model"
}
terraform {
    backend "s3" {
        bucket = "globalstate-exchangeratepredictor"
        key = "terraform.tfstate"
        region = "us-east-2"
        access_key = "AKIAJRIDH2KRTGFDI7GQ"
        secret_key = "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"
        encrypt = "true"
    }
} 
Import-Module "C:\Program Files (x86)\AWS Tools\PowerShell\AWSPowerShell\AWSPowerShell.psd1"

$global:basePath = Resolve-Path ..\
$global:accessKey = "AKIAJRIDH2KRTGFDI7GQ"
$global:secretKey = "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"
$global:region = "us-east-2"
$global:bucketName = "exchange.rate.predictor.model"
$global:filename = "model.sav"
Set-AWSCredentials -AccessKey $accessKey -SecretKey $secretKey
Set-DefaultAWSRegion -Region $region
function training () {
    Push-Location $global:basePath\ExchangeRate-Training
    python ExchangeRateTraining.py 
    Write-S3Object -BucketName $bucketName -File $filename
    Pop-Location
}
function terraform_run () {
    Push-Location $global:basePath\ExchangeRate-AWSBuild\AWSBuild
    terraform init 
    terraform plan 
    terraform apply
    Pop-Location
}


terraform_run
training
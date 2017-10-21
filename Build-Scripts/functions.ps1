Import-Module "C:\Program Files (x86)\AWS Tools\PowerShell\AWSPowerShell\AWSPowerShell.psd1"

$global:basePath = Resolve-Path ..\
$global:accessKey = "xxxxxxxxxxx"
$global:secretKey = "xxxxxxxxxxx"
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
function testing(){
    Push-Location $global:basePath\ExchangeRate-TestData
    python TestData.py $accessKey $secretKey
    Pop-Location
}
function terraform_run () {
    Push-Location $global:basePath\ExchangeRate-AWSBuild\AWSBuild
    terraform init -backend-config "access_key=$accessKey" -backend-config "secret_key=$secretKey" -backend-config "region=$region"
    terraform plan -var "aws_access_key=$accessKey" -var "aws_secret_key=$secretKey" -var "aws_region=$region"
    terraform apply -var "aws_access_key=$accessKey" -var "aws_secret_key=$secretKey" -var "aws_region=$region"
    Pop-Location
}


terraform_run
training
testing
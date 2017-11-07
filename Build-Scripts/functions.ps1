$global:basePath = Resolve-Path ..\
$global:modelbucketName = "crime-rate-predictor-model"
$global:resultbucketName = "crime-rate-predictor-prediction-results"
$global:filename = "model.pickle"
function training () {
    Push-Location $global:basePath\CrimeRate-Training
    python Training.py 
    Write-GcsObject -Bucket $modelbucketName -ObjectName "model1.pickle" -File "model1.pickle" -Force
    Write-GcsObject -Bucket $modelbucketName -ObjectName "model2.pickle" -File "model2.pickle" -Force
    Write-GcsObject -Bucket $modelbucketName -ObjectName "model3.pickle" -File "model3.pickle" -Force
    Pop-Location
}
function prediction(){
    Push-Location $global:basePath\CrimeRate-Prediction
    Read-GcsObject -Bucket $modelbucketName -ObjectName "model1.pickle" -OutFile "model1.pickle"
    Read-GcsObject -Bucket $modelbucketName -ObjectName "model2.pickle" -OutFile "model2.pickle"
    Read-GcsObject -Bucket $modelbucketName -ObjectName "model3.pickle" -OutFile "model3.pickle"
    python Prediction.py
    Write-GcsObject -Bucket $resultbucketName -ObjectName "result1.csv" -File "result1.csv" -Force
    Write-GcsObject -Bucket $resultbucketName -ObjectName "result2.csv" -File "result2.csv" -Force
    Write-GcsObject -Bucket $resultbucketName -ObjectName "result3.csv" -File "result3.csv" -Force
    Pop-Location
}

training
prediction
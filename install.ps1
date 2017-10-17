if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Set-ExecutionPolicy Bypass; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

function Exec($cmd) {
    & $cmd
}

function InstallPackages(){

    Exec{choco install python pip terraform awscli awstools.powershell pycharm-community visualstudiocode}

    #Install Python Packages
    Exec{python -m pip install --upgrade pip}
    Exec{pip install --upgrade setuptools}
    Exec{pip install numpy-1.13.1+mkl-cp35-cp35m-win_amd64.whl}
    Exec{pip install scipy-1.0.0b1-cp35-cp35m-win_amd64.whl}
    Exec{pip install matplotlib scikit-learn sklearn pandas cython}
    Exec{pip install statsmodels-0.8.0-cp35-cp35m-win_amd64.whl}
    Exec{pip install patsy boto3}
    
    Pause
}

InstallPackages

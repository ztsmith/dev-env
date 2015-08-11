function Print($msg) {
    Write-Host "`n*** $msg ***"
}

Print "Installing PsGet"
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

Print "Installing Notepad ++"
cinst notepadplusplus -y

Print "Installing Visual Studio Node.js tools"
$nodeJsToolsSource = "http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=nodejstools&DownloadId=1453232&FileTime=130747426759970000&Build=21024"
$nodeJsInstallPath = "$HOME\VsNodeJsTools.msi"
Invoke-WebRequest $nodeJsToolsSource -OutFile $nodeJsInstallPath
Start-Process -FilePath $nodeJsInstallPath -ArgumentList "/qn" -Wait
Remove-Item $nodeJsInstallPath -Force 

Print "Installing Firefox"
cinst firefox-dev -pre -y

Print "Installing Dotpeek"
cinst dotpeek -y
function Print($msg) {
    Write-Host "`n*** $msg ***"
}

Print "Installing git"
cinst git.install -y

Print "Installing node.js"
cinst nodejs.install -y

Print "Installing Visual Studio 2015"
cinst visualstudio2015enterprise -pre -y

Import-Module $env:ChocolateyInstall\helpers\chocolateyinstaller.psm1

Print "Installing Visual Studio Web Essentials"
$vsixSourcePath = "https://visualstudiogallery.msdn.microsoft.com/ee6e6d8c-c837-41fb-886a-6b50ae2d06a2/file/146119/18/Web%20Essentials%202015.0%20RC%20v0.4.118.vsix"
Install-ChocolateyVsixPackage "WebEssentials" $vsixSourcePath

Print "Installing Visual Studio GitHub Tools"
$vsixSourcePath = "https://visualstudio.github.com/downloads/GitHub.VisualStudio.vsix"
Install-ChocolateyVsixPackage "Visual Studio GitHub Tools" $vsixSourcePath

Print "Pinning Visual Studio to the TaskBar"
Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"

Print "Installing Fiddler"
cinst fiddler4 -y

Print "Installing Chrome"
cinst googlechrome -y
function Print($msg) {
    Write-Host "`n*** $msg ***"
}
Print "args[0] is '$args[0]'"
Print "args[1] is '$args[1]'"
Print "env:installScript is '$env:installScript'"
Print "env:winUpdates is '$env:winUpdates'"

$installScript = if($args[0]) { $args[0] } else { $env:installScript }
if ($installScript -eq $null) {
    Print "No install script found."
    return
}

$winUpdates = $false
if($args[1] -or $env:winUpdates -eq $true) {
    $winUpdates = $true
}

Print "winUpdates is '$winUpdates'"

Print "Installing Boxstarter"
cinst boxstarter -y

Import-Module $env:appdata/boxstarter/boxstarter.chocolatey/boxstarter.chocolatey.psd1
Import-Module $env:appdata/boxstarter/boxstarter.common/boxstarter.common.psd1

$password = ConvertTo-SecureString "dev" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("dev", $password)
Create-BoxstarterTask -credential $cred

Print "Running Boxstarter package"
Import-Module $env:appdata\Boxstarter\Chocolatey\chocolateyinstall\helpers\chocolateyInstaller.psm1 -Force
$installPath = "$Home\$installScript"
Install-BoxstarterPackage -PackageName $installPath -DisableReboots

if ($winUpdates -eq $true) {
    Print "Installing Windows Updates"
    Create-BoxstarterTask -credential $cred
    Install-WindowsUpdate -AcceptEula
} else {
    Print "Skipping Windows Updates"
}

Remove-Item $installPath -Force
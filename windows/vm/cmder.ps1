function Print($msg) {
    Write-Host "`n*** $msg ***"
}

Print "Installing Cmder"
cinst cmder -y

Print "Adding cmder to context menu"
cmd /c "$env:systemdrive\tools\cmder\cmder.exe" /REGISTER All

Print "Adding ConEmu settings"
copy "$env:systemdrive\vagrant\ConEmu.xml" "$env:systemdrive\tools\cmder\config\ConEmu.xml"  -force

#TODO
# add ConEmu.xml and init.bat from parent dir (will need to provision the files)

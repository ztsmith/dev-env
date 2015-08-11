$securityFile = "$HOME\security.cfg"
secedit /export /cfg $securityFile

$securityConfig = get-content $securityFile
$securityConfig = $securityConfig -Replace "PasswordComplexity = 1", "PasswordComplexity = 0"
$securityConfig = $securityConfig -Replace "DisablePasswordChange=4,0", "DisablePasswordChange=4,1"
$securityConfig > $securityFile

secedit /configure /db $env:windir\security\new.sdb /cfg $securityFile /areas SECURITYPOLICY
rm $securityFile -force
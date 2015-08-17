function Print($msg) {
    Write-Host "`n*** $msg ***"
}

function Unpin([string]$shortcut) {
    $shell = New-Object -ComObject "Shell.Application"
    $folder = $shell.NameSpace("$env:AppData\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar")
    $folderItem = $folder.ParseName($shortcut)
    if ($folderItem -ne $null) {
        $verbList = $folderItem.Verbs()
        $unpinVerb = $verbList | Where-Object -Property Name -eq "Unpin from Tas&kbar"
        $unpinVerb.DoIt()        
    }
}

Import-Module $env:ChocolateyInstall\helpers\chocolateyinstaller.psm1

Print "Removing git context menu items"
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT
$hkDir = "HKCR:\Directory"
$hkShellDir = "$hkDir\shell"
$hkBackgroundDir = "$hkDir\background\shell"
$keyNames = @("git_gui", "git_shell")
foreach ($key in $keyNames) {
    $shellPath = "$hkShellDir\$key"
    if (test-path $shellPath) {
        rm $shellPath -recurse
    }
    $backgroundPath = "$hkBackgroundDir\$key"
    if (test-path $backgroundPath) {
        rm $backgroundPath -recurse
    }
}

Print "Unpinning PowerShell"
Unpin "Windows PowerShell.lnk"

Print "Unpinning Server Manager"
Unpin "Server Manager.lnk"

Print "Pinning Cmder"
Install-ChocolateyPinnedTaskBarItem "$env:systemdrive\tools\cmder\cmder.exe"

Print "Pinning Notepad++"
Install-ChocolateyPinnedTaskBarItem "${env:ProgramFiles(x86)}\Notepad++\notepad++.exe"

Print "Disabling Chrome desktop icon"
$chromeSettingsFile = "${env:programfiles(x86)}\Google\Chrome\Application\master_preferences"
$chromeSettings = gc $chromeSettingsFile | Out-String | ConvertFrom-Json
if (!$chromeSettings.distribution.do_not_create_desktop_shortcut) {
    $chromeSettings.distribution | add-member -Name "do_not_create_desktop_shortcut" -MemberType "NoteProperty" -value $true
    $outputJson = $chromeSettings | ConvertTo-Json
    set-content -path $chromeSettingsFile -value $outputJson -force
}

Print "Removing desktop icons"
Get-Item "$env:systemdrive\\users\\*\\Desktop\\*.lnk" | % { if (test-path $_) { Remove-Item $_ -Force } }

Stop-Process -ProcessName explorer
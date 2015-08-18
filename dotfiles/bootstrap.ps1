#requires -version 4.0
#requires –runasadministrator

$dir = $PSScriptRoot
$bakdir = "$env:userprofile\dotfiles_backup"
$gitConfig = ".gitconfig"
$gitConfigPath = "$env:userprofile\$gitConfig"


write-host "> setting up dotfiles for windows"

if (!(test-path $bakdir)) {
    mkdir $bakdir
}

write-host "> backing up git config"
if (test-path $gitConfigPath) {
    mv $gitConfigPath $bakdir\$gitConfig -Force
}

cmd /c mklink $gitConfigPath $dir\$gitConfig
# Installs all dev env host setup for a Windows based machine.
# Must be run in admin context.

Try {
    $chocoVersion = choco -v
    if ($chocoVersion -match "^[\d\.]+$") {
        write-host "Chocolatey $chocoVersion already installed"
    }
}
Catch {
    write-host "Installing Chocolatey"
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
}

cinst virtualbox -y
cinst vagrant -y

vagrant plugin install vagrant-winnfsd

#change vagrant home dir to D:\
if (!$env:VAGRANT_HOME)
{
    [Environment]::SetEnvironmentVariable("VAGRANT_HOME", "D:\VM\Vagrant", [System.EnvironmentVariableTarget]::Machine)
}



# TODO
# - install/update cmder (include aliases and init.bat)
# - setup github/bitbucket rsa keys?
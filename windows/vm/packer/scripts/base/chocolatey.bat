powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" <NUL

setx PATH "%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" /m

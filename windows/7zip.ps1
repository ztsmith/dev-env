cinst 7zip.install -y

cmd /c assoc .7z=7-Zip.7z
cmd /c assoc .bz2=7-Zip.bz2
cmd /c assoc .gz=7-Zip.gz
cmd /c assoc .gzip=7-Zip.gzip
cmd /c assoc .rar=7-Zip.rar
cmd /c assoc .tar=7-Zip.tar
cmd /c assoc .tgz=7-Zip.tgz
cmd /c assoc .zip=7-Zip.zip

cmd /c 'ftype 7-Zip.7z="c:\program files\7-Zip\7zFM.exe" "%1"'
cmd /c 'ftype 7-Zip.bz2="$c:\program files\7-Zip\7zFM.exe" "%1"'
cmd /c 'ftype 7-Zip.gz="c:\program files\7-Zip\7zFM.exe" "%1"'
cmd /c 'ftype 7-Zip.gzip="c:\program files\7-Zip\7zFM.exe" "%1"'
cmd /c 'ftype 7-Zip.rar="c:\program files\7-Zip\7zFM.exe" "%1"'
cmd /c 'ftype 7-Zip.tar="c:\program files\7-Zip\7zFM.exe" "%1"'
cmd /c 'ftype 7-Zip.tgz="c:\program files\7-Zip\7zFM.exe" "%1"'
cmd /c 'ftype 7-Zip.zip="c:\program files\7-Zip\7zFM.exe" "%1"'

$7zipRegPath = "HKCU:\Software\7-Zip"
$7zipOptionsRegPath = "$7zipRegPath\Options"
if (!(Test-Path $7zipOptionsRegPath)) {
    New-Item -Path $7zipRegPath -Name Options
    Set-ItemProperty -Path $7zipOptionsRegPath -Name ContextMenu -Value 4471
}
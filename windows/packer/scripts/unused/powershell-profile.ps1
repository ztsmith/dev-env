function Set-VsCmd
{
    param(
        [parameter(Mandatory, HelpMessage="Enter VS version as 2010, 2012, or 2013")]
        [ValidateSet(2010,2012,2013,2015)]
        [int]$version
    )
    $VS_VERSION = @{ 2010 = "10.0"; 2012 = "11.0"; 2013 = "12.0"; 2015 = "14.0" }
    $targetDir = "c:\Program Files (x86)\Microsoft Visual Studio $($VS_VERSION[$version])\VC"
    if (!(Test-Path (Join-Path $targetDir "vcvarsall.bat"))) {
        "Error: Visual Studio $version not installed"
        return
    }
    pushd $targetDir
    cmd /c "vcvarsall.bat&set" |
    foreach {
      if ($_ -match "(.*?)=(.*)") {
        Set-Item -force -path "ENV:\$($matches[1])" -value "$($matches[2])"
      }
    }
    popd
    write-host "`nVisual Studio $version Command Prompt variables set." -ForegroundColor Yellow
}

Set-VsCmd 2015
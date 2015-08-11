function Print($msg) {
    Write-Host "`n*** $msg ***"
}

# Print "Allowing self-signed certs for Git Enterprise"
git config --global http.sslverify false
winget install NuGet

powershell -NoProfile -ExecutionPolicy Bypass -Command "$s = Invoke-RestMethod 'https://aka.ms/install-artifacts-credprovider.ps1'; $p = Join-Path $env:TEMP 'installcredprovider.ps1'; Set-Content -Path $p -Value $s; powershell -ExecutionPolicy Bypass -File $p -AddNetFx -Force"

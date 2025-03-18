# Stop Default Web Site
Import-Module WebAdministration
if (Test-Path "IIS:\Sites\Default Web Site") {
  Stop-Website -Name "Default Web Site"
}

# Remove existing app directory if it exists
if (Test-Path "C:\inetpub\wwwroot\MyApp") {
  Remove-Item "C:\inetpub\wwwroot\MyApp" -Recurse -Force
}

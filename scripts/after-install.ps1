# Create new IIS application pool if it doesn't exist
Import-Module WebAdministration
if (!(Test-Path "IIS:\AppPools\MyAppPool")) {
  New-WebAppPool -Name "MyAppPool"
  Set-ItemProperty -Path "IIS:\AppPools\MyAppPool" -Name "managedRuntimeVersion" -Value ""
}

# Create the website if it doesn't exist
if (!(Test-Path "IIS:\Sites\MyApp")) {
  New-Website -Name "MyApp" -PhysicalPath "C:\inetpub\wwwroot\MyApp" -ApplicationPool "MyAppPool" -Port 80
} else {
  Set-ItemProperty -Path "IIS:\Sites\MyApp" -Name "physicalPath" -Value "C:\inetpub\wwwroot\MyApp"
}

# Start the website
Start-Website -Name "MyApp"

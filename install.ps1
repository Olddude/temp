# Set variables for installation location and language settings
$WindowsDriveLetter = "C:"
$WindowsLanguage = "en-US"

# Start Windows Setup
Start-Process -FilePath "$($env:SystemDrive)\sources\setup.exe" -ArgumentList "/Auto Upgrade /Quiet /NoReboot /DynamicUpdate Disable /ShowOOBE None /Telemetry Disable /InstallLangPacks $WindowsLanguage /ImageIndex 1 /postoobe C:\PostOOBE.cmd /InstallFrom $WindowsDriveLetter" -Wait

# Set variables for download location and Windows version
$DownloadFolder = "C:\Windows10Download"
$WindowsVersion = "1909"  # Replace with the desired version

# Create download folder if it doesn't exist
New-Item -ItemType Directory -Path $DownloadFolder -Force | Out-Null

# Download Windows 10 ISO file
Invoke-WebRequest -Uri "https://software-download.microsoft.com/download/pr/19041.867.21030519.1600_co_release_CLIENTMULTICOMBINED_UUP_X64FRE_EN-US.ISO" -OutFile "$DownloadFolder\Windows10_${WindowsVersion}.iso"

# Mount the ISO file
$MountResult = Mount-DiskImage -ImagePath "$DownloadFolder\Windows10_${WindowsVersion}.iso" -PassThru

# Set variables for installation location and language settings
$WindowsDriveLetter = "C:"
$WindowsLanguage = "en-US"

# Install Windows 10
Start-Process -FilePath "$($MountResult.DriveLetter):\setup.exe" -ArgumentList "/Auto Upgrade /Quiet /NoReboot /DynamicUpdate Disable /ShowOOBE None /Telemetry Disable /InstallLangPacks $WindowsLanguage /ImageIndex 1 /postoobe $DownloadFolder\PostOOBE.cmd /InstallFrom $WindowsDriveLetter" -Wait

# Unmount the ISO file
Dismount-DiskImage -ImagePath "$DownloadFolder\Windows10_${WindowsVersion}.iso"


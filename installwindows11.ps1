# Define the URL of the Windows 11 Media Creation Tool
$mediaCreationToolUrl = "https://go.microsoft.com/fwlink/?LinkId=2120059"

# Define the path to save the downloaded file
$saveFilePath = "C:\Windows11MediaCreationTool.exe"

# Create a new WebClient object
$webClient = New-Object System.Net.WebClient

# Download the file and save it to the specified path
$webClient.DownloadFile($mediaCreationToolUrl, $saveFilePath)

# Display a message to indicate that the download is complete
Write-Host "Windows 11 Media Creation Tool has been downloaded and saved to: " $saveFilePath

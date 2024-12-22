#https://hpia.hpcloud.hp.com/downloads/cmsl/hp-cmsl-1.8.1.exe
#C:\Users\Asus\Desktop\CMSL_Automation_PwSh\hp-cmsl-1.8.1.exe

# Define the URL of the installer
$installerUrl = "https://hpia.hpcloud.hp.com/downloads/cmsl/hp-cmsl-1.8.1.exe"  # Replace with actual URL

# Define the path where the installer will be saved
$installerPath = "C:\Users\Asus\Desktop\CMSL_Automation_PwSh\hp-cmsl-1.8.1.exe"  # Replace with desired path

# Define silent installation arguments (modify as needed)
$silentArgs = "/S"  # Common argument for silent installation

# Create the Temp directory if it doesn't exist
if (-not (Test-Path "C:\Temp")) {
    New-Item -ItemType Directory -Path "C:\Temp"
}

# Download the installer
try {
    Write-Host "Downloading installer from $installerUrl..."
    Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

    # Check if the download was successful
    if (Test-Path $installerPath) {
        Write-Host "Download completed successfully."

        # Start the silent installation process
        Write-Host "Starting installation..."
        $process = Start-Process -FilePath $installerPath -ArgumentList $silentArgs -Wait -NoNewWindow -PassThru

        # Check the exit code to determine if the installation was successful
        if ($process.ExitCode -eq 0) {
            Write-Host "Installation completed successfully."
        } else {
            Write-Host "Installation failed with exit code: $($process.ExitCode)"
        }
    } else {
        Write-Host "Download failed. Installer not found at path: $installerPath"
    }
} catch {
    Write-Host "An error occurred: $_"
}
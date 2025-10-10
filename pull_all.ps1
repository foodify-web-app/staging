# commmand to execute the process (run in powershell )
# powershell -ExecutionPolicy Bypass -File .\pull_all.ps1


# Go to your root folder first (edit this path)
cd "D:\foodify"

# Loop through each subfolder
Get-ChildItem -Directory | ForEach-Object {
    Write-Host "Updating repo: $($_.Name)"
    Set-Location $_.FullName
    if (Test-Path ".git") {
        git pull
    } else {
        Write-Host "Not a git repository, skipping."
    }
    Set-Location ..
}

Write-Host "All repositories updated successfully!"

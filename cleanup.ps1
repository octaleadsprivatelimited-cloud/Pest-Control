# PowerShell script to clean up the project
Write-Host "Starting cleanup process..."

# Remove duplicate MAINFILE-2 folder
if (Test-Path "MAINFILE-2") {
    Write-Host "Removing MAINFILE-2 folder..."
    Remove-Item -Recurse -Force "MAINFILE-2"
    Write-Host "MAINFILE-2 folder removed successfully."
} else {
    Write-Host "MAINFILE-2 folder not found."
}

# Remove corrupted files
$corruptedFiles = @(
    "600X600.jpg images600x600.jpg",
    "X ForEach-Object { Rename-Item `$_.FullName (`$_.Name -replace 'X', 'x') }"
)

foreach ($file in $corruptedFiles) {
    if (Test-Path $file) {
        Write-Host "Removing corrupted file: $file"
        Remove-Item -Force $file
    }
}

# Rename image files to fix case sensitivity
$imageFiles = @(
    @{Old = "images\600X600.jpg"; New = "images\600x600.jpg"},
    @{Old = "images\800X500.jpg"; New = "images\800x500.jpg"}
)

foreach ($file in $imageFiles) {
    if (Test-Path $file.Old) {
        Write-Host "Renaming $($file.Old) to $($file.New)"
        Rename-Item $file.Old $file.New
    }
}

Write-Host "Cleanup completed successfully!"

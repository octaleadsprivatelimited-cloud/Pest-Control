# Apply changes to main branch
Write-Host "Applying changes to main branch..."

# Check current branch
$currentBranch = git branch --show-current
Write-Host "Current branch: $currentBranch"

# Switch to main branch (create if it doesn't exist)
try {
    git checkout main
    Write-Host "Switched to main branch"
} catch {
    git checkout -b main
    Write-Host "Created and switched to main branch"
}

# Merge master into main
git merge master
Write-Host "Merged master into main"

# Push to main branch
git push origin main
Write-Host "Pushed to main branch"

# Also push to master for compatibility
git push origin master
Write-Host "Pushed to master branch"

Write-Host "Changes applied to main branch successfully!"

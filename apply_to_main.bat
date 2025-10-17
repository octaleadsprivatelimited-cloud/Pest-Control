@echo off
echo Applying changes to main branch...

REM Check current branch
git branch --show-current

REM Switch to main branch (create if it doesn't exist)
git checkout -b main 2>nul || git checkout main

REM Merge master into main
git merge master

REM Push to main branch
git push origin main

REM Also push to master for compatibility
git push origin master

echo Changes applied to main branch successfully!
pause

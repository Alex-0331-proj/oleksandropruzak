@echo off
cd /d "%~dp0"

echo Switching to dev branch...
git checkout dev
if errorlevel 1 git checkout -b dev

echo.
echo Fetching latest changes...
git fetch origin

echo.
echo Merging main into dev...
git merge origin/main --no-edit

echo.
echo Pushing to GitHub...
git push origin dev

echo.
echo Done!
pause


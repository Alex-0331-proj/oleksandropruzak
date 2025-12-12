@echo off
chcp 65001 >nul
cd /d "%~dp0"
git add .
git commit -m "Add CI/CD workflow for SmartNotes"
git remote remove origin 2>nul
git remote add origin https://github.com/Alex-0331-proj/oleksandropruzak.git
git branch -M main
git push -u origin main
git checkout -b dev 2>nul
git push -u origin dev
pause


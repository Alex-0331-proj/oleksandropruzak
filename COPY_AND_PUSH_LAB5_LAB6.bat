@echo off
cd /d "%~dp0"

echo ========================================
echo Копiювання та додавання Lab 5 i Lab 6
echo ========================================
echo.

echo Отримання останнiх змiн з GitHub...
git fetch origin

echo.
echo Перехiд на гiлку dev...
git checkout dev
if errorlevel 1 (
    echo Створення гiлки dev...
    git checkout -b dev
)

echo.
echo Копiювання файлiв з main...
git checkout origin/main -- .github/workflows/ci.yml 2>nul
if exist ".github\workflows\ci.yml" (
    echo Workflow файл скопiйовано з main
) else (
    echo Увага: workflow файл не знайдено в main
)

git checkout origin/main -- "ЛБ5_Тестування_Відлагодження.html" 2>nul
if exist "ЛБ5_Тестування_Відлагодження.html" (
    echo Звiт Lab 5 скопiйовано з main
)

git checkout origin/main -- "lab6_report.html" 2>nul
if exist "lab6_report.html" (
    echo Звiт Lab 6 скопiйовано з main
)

echo.
echo Додавання workflow файлу...
if exist ".github\workflows\ci.yml" (
    git add .github\workflows\ci.yml
)

echo.
echo Додавання звiтiв...
if exist "ЛБ5_Тестування_Відлагодження.html" (
    git add "ЛБ5_Тестування_Відлагодження.html"
)
if exist "lab6_report.html" (
    git add "lab6_report.html"
)

echo.
echo Додавання скрiншотiв...
git add screenshots\*.jpg 2>nul
git add screenshots\*.png 2>nul
git add screenshots\*.svg 2>nul

echo.
echo Додавання додатку SmartNotes...
git add smartnotes\*.py

echo.
echo Додавання requirements.txt...
if exist "requirements.txt" (
    git add requirements.txt
)

echo.
echo Додавання README...
git add README.md

echo.
echo Перевiрка статусу...
git status

echo.
echo Створення комiту...
git commit -m "Add Lab 5 and Lab 6 materials (workflow, reports, screenshots)"

echo.
echo Вiдправка на GitHub...
git push origin dev

echo.
echo ========================================
echo Готово! Матерiали додано та вiдправлено.
echo ========================================
pause


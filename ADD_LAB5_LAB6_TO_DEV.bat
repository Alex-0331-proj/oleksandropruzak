@echo off
cd /d "%~dp0"

echo ========================================
echo Додавання матерiалiв Lab 5 i Lab 6 у dev
echo ========================================
echo.

echo Перехiд на гiлку dev...
git checkout dev
if errorlevel 1 (
    echo Створення гiлки dev...
    git checkout -b dev
)

echo.
echo Додавання workflow файлу...
if exist ".github\workflows\ci.yml" (
    git add .github\workflows\ci.yml
    echo Workflow файл знайдено та додано
) else (
    echo Увага: workflow файл не знайдено
    echo Перевiрте, чи файл iснує в main гiлцi
)

echo.
echo Додавання звітів...
if exist "ЛБ5_Тестування_Відлагодження.html" (
    git add "ЛБ5_Тестування_Відлагодження.html"
    echo Звіт Lab 5 додано
)
if exist "lab6_report.html" (
    git add "lab6_report.html"
    echo Звіт Lab 6 додано
)

echo.
echo Додавання скріншотів...
git add screenshots\*.jpg 2>nul
git add screenshots\*.png 2>nul
git add screenshots\*.svg 2>nul
if exist "screenshots\*.jpg" echo JPG скрiншоти додано
if exist "screenshots\*.png" echo PNG скрiншоти додано
if exist "screenshots\*.svg" echo SVG скрiншоти додано

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
echo Перевiрка, чи є щось для комiту...
git diff --cached --quiet
if errorlevel 1 (
    echo Створення комiту...
    git commit -m "Add Lab 5 and Lab 6 materials (workflow, reports, screenshots)"
) else (
    echo Немає змiн для комiту. Можливо, файли вже доданi або не знайдено.
    echo Перевiрте статус вище.
)

echo.
echo Вiдправка на GitHub...
git push origin dev

echo.
echo ========================================
echo Готово! Матерiали додано у dev.
echo ========================================
pause


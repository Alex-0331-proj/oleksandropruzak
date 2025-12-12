@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ========================================
echo Додавання звітів Lab 5 i Lab 6 до Git
echo ========================================
echo.

echo Додавання HTML звітів...
git add "ЛБ5_Тестування_Відлагодження.html"
git add "lab6_report.html"

echo Додавання скріншотів...
git add screenshots\*.jpg
git add screenshots\*.svg

echo.
echo Перевірка статусу...
git status

echo.
echo Створення коміту...
git commit -m "Add Lab 5 and Lab 6 reports with screenshots"

echo.
echo Відправка на GitHub (dev branch)...
git push origin dev

echo.
echo ========================================
echo Готово! Звіти додано до репозиторію.
echo ========================================
pause


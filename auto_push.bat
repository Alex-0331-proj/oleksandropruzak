@echo off
chcp 65001 >nul
echo ========================================
echo Автоматичний push в GitHub
echo ========================================
echo.

cd /d "%~dp0"

echo 1. Перевірка статусу Git...
git status

echo.
echo 2. Додавання всіх файлів...
git add .

echo.
echo 3. Створення коміту...
git commit -m "Add CI/CD workflow for SmartNotes"

echo.
echo 4. Налаштування remote...
git remote remove origin 2>nul
git remote add origin https://github.com/Alex-0331-proj/oleksandropruzak.git

echo.
echo 5. Перевірка remote...
git remote -v

echo.
echo 6. Створення гілки main...
git branch -M main

echo.
echo 7. Push в main...
git push -u origin main

echo.
echo 8. Створення гілки dev...
git checkout -b dev 2>nul || git checkout dev
git push -u origin dev

echo.
echo ========================================
echo Готово! Перевірте GitHub Actions:
echo https://github.com/Alex-0331-proj/oleksandropruzak/actions
echo ========================================
echo.
pause


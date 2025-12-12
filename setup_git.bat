@echo off
chcp 65001 >nul
echo ========================================
echo Налаштування Git репозиторію для Lab 6
echo ========================================
echo.

cd /d "%~dp0"

echo 1. Ініціалізація Git репозиторію...
git init
if errorlevel 1 (
    echo Помилка: Git не встановлено або не налаштовано
    pause
    exit /b 1
)

echo.
echo 2. Додавання remote репозиторію...
git remote remove origin 2>nul
git remote add origin https://github.com/Alex-0331-proj/oleksandropruzak.git

echo.
echo 3. Додавання файлів...
git add .

echo.
echo 4. Створення першого коміту...
git commit -m "Add CI/CD workflow for SmartNotes"

echo.
echo 5. Створення гілки dev...
git checkout -b dev
git add .
git commit -m "Add CI/CD workflow for SmartNotes (dev branch)"

echo.
echo ========================================
echo Налаштування завершено!
echo ========================================
echo.
echo Наступні кроки:
echo 1. Перевірте налаштування: git remote -v
echo 2. Push в main: git checkout main ^&^& git push -u origin main
echo 3. Push в dev: git checkout dev ^&^& git push -u origin dev
echo.
echo Після push workflow автоматично запуститься!
echo.
pause


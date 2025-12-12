@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ========================================
echo Перенесення змiн з main у dev
echo ========================================
echo.

echo Перевiрка поточної гiлки...
git branch

echo.
echo Перехiд на гiлку dev...
git checkout dev
if errorlevel 1 (
    echo Помилка: не вдалося перейти на гiлку dev
    echo Створення гiлки dev...
    git checkout -b dev
)

echo.
echo Отримання останнiх змiн...
git fetch origin

echo.
echo Оновлення dev з main...
git merge origin/main --no-edit
if errorlevel 1 (
    echo Помилка при злиттi. Спробуйте вручну.
    pause
    exit /b 1
)

echo.
echo Вiдправка змiн на GitHub...
git push origin dev
if errorlevel 1 (
    echo Помилка при вiдправцi. Перевiрте налаштування.
    pause
    exit /b 1
)

echo.
echo ========================================
echo Готово! Змiни з main перенесено у dev.
echo ========================================
pause


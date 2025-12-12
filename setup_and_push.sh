#!/bin/bash
# Скрипт для налаштування Git та push в репозиторій

echo "========================================"
echo "Налаштування Git репозиторію для Lab 6"
echo "========================================"
echo ""

# Перехід в директорію lab5
cd "$(dirname "$0")"

echo "1. Перевірка поточної директорії..."
pwd

echo ""
echo "2. Ініціалізація Git репозиторію (якщо потрібно)..."
if [ ! -d ".git" ]; then
    git init
fi

echo ""
echo "3. Додавання remote репозиторію..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/Alex-0331-proj/oleksandropruzak.git

echo ""
echo "4. Перевірка remote..."
git remote -v

echo ""
echo "5. Додавання всіх файлів..."
git add .

echo ""
echo "6. Статус перед комітом..."
git status

echo ""
echo "7. Створення коміту..."
git commit -m "Add CI/CD workflow for SmartNotes"

echo ""
echo "8. Створення гілки main (якщо потрібно)..."
git branch -M main

echo ""
echo "9. Push в main..."
git push -u origin main

echo ""
echo "10. Створення гілки dev..."
git checkout -b dev
git add .
git commit -m "Add CI/CD workflow for SmartNotes (dev branch)"
git push -u origin dev

echo ""
echo "========================================"
echo "Налаштування завершено!"
echo "========================================"
echo ""
echo "Перевірте GitHub Actions:"
echo "https://github.com/Alex-0331-proj/oleksandropruzak/actions"
echo ""


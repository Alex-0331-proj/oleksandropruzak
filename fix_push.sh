#!/bin/bash
# Скрипт для виправлення проблеми з push

echo "========================================"
echo "Виправлення проблеми з Git push"
echo "========================================"
echo ""

# Перехід в директорію lab5
cd ~/Desktop/гітік/lab5

echo "1. Перевірка поточної гілки..."
git branch

echo ""
echo "2. Перевірка статусу..."
git status

echo ""
echo "3. Додавання всіх файлів..."
git add .

echo ""
echo "4. Перевірка що додано..."
git status

echo ""
echo "5. Створення коміту (якщо є зміни)..."
git commit -m "Add CI/CD workflow for SmartNotes" || echo "Немає змін для коміту"

echo ""
echo "6. Перевірка гілок..."
git branch -a

echo ""
echo "7. Створення гілки main з поточної..."
git checkout -b main 2>/dev/null || git branch -M main

echo ""
echo "8. Перевірка remote..."
git remote -v

echo ""
echo "9. Push в main..."
git push -u origin main

echo ""
echo "10. Повернення на dev та push..."
git checkout dev
git push -u origin dev

echo ""
echo "========================================"
echo "Готово!"
echo "========================================"


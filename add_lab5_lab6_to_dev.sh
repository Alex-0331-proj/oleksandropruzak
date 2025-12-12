#!/bin/bash

echo "========================================"
echo "Додавання матерiалiв Lab 5 i Lab 6 у dev"
echo "========================================"
echo ""

cd "$(dirname "$0")"

echo "Перехiд на гiлку dev..."
git checkout dev || git checkout -b dev

echo ""
echo "Додавання workflow файлу..."
if [ -f ".github/workflows/ci.yml" ]; then
    git add .github/workflows/ci.yml
    echo "Workflow файл знайдено та додано"
else
    echo "Увага: workflow файл не знайдено"
fi

echo ""
echo "Додавання звітів..."
[ -f "ЛБ5_Тестування_Відлагодження.html" ] && git add "ЛБ5_Тестування_Відлагодження.html" && echo "Звіт Lab 5 додано"
[ -f "lab6_report.html" ] && git add "lab6_report.html" && echo "Звіт Lab 6 додано"

echo ""
echo "Додавання скріншотів..."
git add screenshots/*.jpg screenshots/*.png screenshots/*.svg 2>/dev/null

echo ""
echo "Додавання додатку SmartNotes..."
git add smartnotes/*.py

echo ""
echo "Додавання requirements.txt..."
[ -f "requirements.txt" ] && git add requirements.txt

echo ""
echo "Додавання README..."
git add README.md

echo ""
echo "Перевiрка статусу..."
git status

echo ""
echo "Створення комiту..."
git commit -m "Add Lab 5 and Lab 6 materials (workflow, reports, screenshots)"

echo ""
echo "Вiдправка на GitHub..."
git push origin dev

echo ""
echo "========================================"
echo "Готово! Матерiали додано у dev."
echo "========================================"


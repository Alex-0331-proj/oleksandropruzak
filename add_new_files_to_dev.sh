#!/bin/bash

echo "========================================"
echo "Додавання нових файлiв до dev"
echo "========================================"
echo ""

cd "$(dirname "$0")"

echo "Перехiд на гiлку dev..."
git checkout dev || git checkout -b dev

echo ""
echo "Додавання всiх нових файлiв..."
git add ADD_LAB5_LAB6_TO_DEV.bat
git add ADD_LAB5_LAB6_TO_DEV.md
git add ADD_REPORTS.bat
git add add_reports.sh
git add COPY_ALL_FROM_MAIN.bat
git add COPY_ALL_FROM_MAIN.md
git add copy_all_from_main.sh
git add MERGE_MAIN_TO_DEV.bat
git add MERGE_MAIN_TO_DEV.md
git add merge_main_to_dev.sh
git add MERGE_SIMPLE.bat
git add COPY_AND_PUSH_LAB5_LAB6.bat
git add add_lab5_lab6_to_dev.sh

echo ""
echo "Додавання PDF файлiв..."
[ -f "lab6_report.pdf" ] && git add lab6_report.pdf

echo ""
echo "Додавання iнструкцiй..."
[ -f "ІНСТРУКЦІЯ_ПЕРЕТВОРЕННЯ_В_PDF.txt" ] && git add "ІНСТРУКЦІЯ_ПЕРЕТВОРЕННЯ_В_PDF.txt"

echo ""
echo "Додавання всiх iнших нових файлiв..."
git add -A

echo ""
echo "Перевiрка статусу..."
git status

echo ""
echo "Створення комiту..."
git commit -m "Add new files: scripts, instructions, and reports"

echo ""
echo "Вiдправка на GitHub..."
git push origin dev

echo ""
echo "========================================"
echo "Готово! Новi файли додано та вiдправлено."
echo "========================================"


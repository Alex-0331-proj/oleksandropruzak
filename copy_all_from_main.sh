#!/bin/bash

echo "========================================"
echo "Перенесення всiх файлiв з main у dev"
echo "========================================"
echo ""

cd "$(dirname "$0")"

echo "Перевiрка поточної гiлки..."
git branch

echo ""
echo "Отримання останнiх змiн з GitHub..."
git fetch origin

echo ""
echo "Перехiд на гiлку dev..."
git checkout dev || git checkout -b dev

echo ""
echo "Злиття всiх змiн з main у dev..."
git merge origin/main --no-edit --strategy-option theirs || git reset --hard origin/main

echo ""
echo "Перевiрка статусу..."
git status

echo ""
echo "Вiдправка всiх змiн на GitHub..."
git push origin dev --force-with-lease

echo ""
echo "========================================"
echo "Готово! Всi файли з main перенесено у dev."
echo "========================================"


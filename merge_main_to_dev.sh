#!/bin/bash

echo "========================================"
echo "Перенесення змін з main у dev"
echo "========================================"
echo ""

cd "$(dirname "$0")"

echo "Перевірка поточної гілки..."
git branch --show-current

echo ""
echo "Перехід на гілку dev..."
git checkout dev

echo ""
echo "Оновлення dev з main..."
git merge main --no-edit

echo ""
echo "Відправка змін на GitHub..."
git push origin dev

echo ""
echo "========================================"
echo "Готово! Зміни з main перенесено у dev."
echo "========================================"


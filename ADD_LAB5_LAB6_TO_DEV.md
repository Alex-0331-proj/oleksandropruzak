# Додавання матеріалів Lab 5 і Lab 6 у dev

## Що додається:

1. **Workflow файл** - `.github/workflows/ci.yml`
2. **Звіти** - `ЛБ5_Тестування_Відлагодження.html`, `lab6_report.html`
3. **Скріншоти** - всі JPG, PNG, SVG з папки `screenshots/`
4. **Додаток SmartNotes** - файли з папки `smartnotes/`
5. **Requirements** - `requirements.txt`
6. **README** - `README.md`

## Команди для виконання вручну

```bash
cd lab5

# Перейти на dev
git checkout dev || git checkout -b dev

# Додати workflow
git add .github/workflows/ci.yml

# Додати звіти
git add "ЛБ5_Тестування_Відлагодження.html"
git add "lab6_report.html"

# Додати скріншоти
git add screenshots/*.jpg screenshots/*.png screenshots/*.svg

# Додати додаток
git add smartnotes/*.py

# Додати інші файли
git add requirements.txt README.md

# Створити коміт
git commit -m "Add Lab 5 and Lab 6 materials (workflow, reports, screenshots)"

# Відправити на GitHub
git push origin dev
```

## Або запустіть скрипт

**Windows:** Подвійний клік на `ADD_LAB5_LAB6_TO_DEV.bat`

**Git Bash:** 
```bash
bash add_lab5_lab6_to_dev.sh
```


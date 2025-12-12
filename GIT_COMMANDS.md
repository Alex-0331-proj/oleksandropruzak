# Команди Git для налаштування репозиторію

## Варіант 1: Використання batch файлу

Просто запустіть:
```bash
setup_git.bat
```

## Варіант 2: Ручне налаштування

### 1. Ініціалізація репозиторію
```bash
cd lab5
git init
```

### 2. Додавання remote репозиторію
```bash
git remote add origin https://github.com/Alex-0331-proj/oleksandropruzak.git
```

### 3. Перевірка remote
```bash
git remote -v
```

### 4. Додавання файлів
```bash
git add .
```

### 5. Створення першого коміту
```bash
git commit -m "Add CI/CD workflow for SmartNotes"
```

### 6. Створення гілки main (якщо потрібно)
```bash
git branch -M main
```

### 7. Створення гілки dev
```bash
git checkout -b dev
git add .
git commit -m "Add CI/CD workflow for SmartNotes (dev branch)"
```

### 8. Push в main
```bash
git checkout main
git push -u origin main
```

### 9. Push в dev
```bash
git checkout dev
git push -u origin dev
```

## Перевірка Workflow

Після push:
1. Перейдіть на GitHub: https://github.com/Alex-0331-proj/oleksandropruzak
2. Відкрийте розділ "Actions"
3. Перевірте, що workflow запустився
4. Дочекайтеся завершення виконання
5. Перевірте розділ "Releases" - має з'явитися автоматичний реліз

## Тестування Workflow

Для тестування внесіть будь-які зміни:

```bash
# Внесіть зміни у файл
echo "# Test" >> README.md

# Commit та push
git add .
git commit -m "Test workflow"
git push origin main
```

Workflow автоматично запуститься після push!


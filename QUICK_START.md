# Швидкий старт для Lab 6

## Проблема: "Everything up-to-date"

Якщо при `git push` ви бачите "Everything up-to-date", це означає, що зміни не були закомічені.

## Рішення:

### Варіант 1: Використання скрипту (Git Bash)

1. Відкрийте Git Bash
2. Перейдіть в папку lab5:
```bash
cd ~/Desktop/гітік/lab5
```

3. Запустіть скрипт:
```bash
bash setup_and_push.sh
```

### Варіант 2: Ручні команди (Git Bash)

Виконайте ці команди по черзі в Git Bash:

```bash
# 1. Перехід в папку lab5
cd ~/Desktop/гітік/lab5

# 2. Перевірка статусу
git status

# 3. Ініціалізація (якщо потрібно)
git init

# 4. Додавання remote
git remote remove origin
git remote add origin https://github.com/Alex-0331-proj/oleksandropruzak.git

# 5. Додавання всіх файлів
git add .

# 6. Перевірка що додано
git status

# 7. Створення коміту
git commit -m "Add CI/CD workflow for SmartNotes"

# 8. Створення гілки main
git branch -M main

# 9. Push в main
git push -u origin main

# 10. Створення гілки dev
git checkout -b dev
git add .
git commit -m "Add CI/CD workflow for SmartNotes (dev branch)"
git push -u origin dev
```

## Перевірка

Після push:
1. Відкрийте: https://github.com/Alex-0331-proj/oleksandropruzak
2. Перейдіть в "Actions" - там має з'явитися workflow
3. Перейдіть в "Releases" - там має з'явитися автоматичний реліз

## Якщо все ще не працює

Перевірте:
1. Чи ви в правильній директорії? (`pwd` має показувати `.../гітік/lab5`)
2. Чи є файл `.github/workflows/ci.yml`? (`ls -la .github/workflows/`)
3. Чи додані файли? (`git status` має показувати зміни)


# Виправлення проблеми з Git

## Проблема: "Everything up-to-date"

Це означає, що зміни не були закомічені або ви не в правильній директорії.

## Крок 1: Перевірка директорії

У Git Bash виконайте:
```bash
pwd
```

Має показати: `/c/Users/Admin/Desktop/гітік/lab5`

Якщо ні, перейдіть:
```bash
cd ~/Desktop/гітік/lab5
```

## Крок 2: Перевірка Git статусу

```bash
git status
```

Якщо бачите "not a git repository":
```bash
git init
```

## Крок 3: Перевірка файлів

Перевірте, чи є workflow файл:
```bash
ls -la .github/workflows/ci.yml
```

Якщо файлу немає, створіть структуру:
```bash
mkdir -p .github/workflows
```

## Крок 4: Додавання файлів

```bash
git add .
git status
```

Має показати всі нові файли (зеленим кольором).

## Крок 5: Створення коміту

```bash
git commit -m "Add CI/CD workflow for SmartNotes"
```

## Крок 6: Налаштування remote

```bash
git remote remove origin
git remote add origin https://github.com/Alex-0331-proj/oleksandropruzak.git
git remote -v
```

## Крок 7: Push

```bash
git branch -M main
git push -u origin main
```

## Якщо помилка "remote origin already exists"

Виконайте:
```bash
git remote set-url origin https://github.com/Alex-0331-proj/oleksandropruzak.git
```

## Якщо помилка авторизації

Налаштуйте Git credentials або використайте Personal Access Token.


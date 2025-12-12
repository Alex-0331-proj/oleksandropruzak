# Покрокові інструкції для виправлення

## Проблема: "error: src refspec main does not match any"

Це означає, що гілка `main` не існує локально. Ви зараз на гілці `dev`.

## Рішення:

### Крок 1: Перевірте статус
```bash
git status
git branch
```

### Крок 2: Додайте файли (якщо є зміни)
```bash
git add .
git status
```

### Крок 3: Створіть коміт (якщо є зміни)
```bash
git commit -m "Add CI/CD workflow for SmartNotes"
```

### Крок 4: Створіть гілку main з поточної
```bash
git checkout -b main
```

АБО якщо ви хочете перейменувати dev в main:
```bash
git branch -M main
```

### Крок 5: Push в main
```bash
git push -u origin main
```

### Крок 6: Створіть dev гілку (якщо потрібно)
```bash
git checkout -b dev
git push -u origin dev
```

## Альтернативний варіант (якщо main вже існує на remote)

```bash
# Отримати всі гілки з remote
git fetch origin

# Перевірити які гілки є
git branch -a

# Переключитися на main (якщо вона існує)
git checkout main

# Або створити локальну main з remote
git checkout -b main origin/main
```

## Швидке рішення (все в одному):

```bash
cd ~/Desktop/гітік/lab5
git add .
git commit -m "Add CI/CD workflow for SmartNotes"
git checkout -b main
git push -u origin main
git checkout -b dev
git push -u origin dev
```


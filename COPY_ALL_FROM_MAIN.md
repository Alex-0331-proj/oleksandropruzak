# Перенесення всіх файлів з main у dev

## Команди для виконання вручну

```bash
cd lab5

# Отримати останні зміни
git fetch origin

# Перейти на dev (або створити, якщо не існує)
git checkout dev || git checkout -b dev

# Злити всі зміни з main (використовуємо стратегію theirs для вирішення конфліктів)
git merge origin/main --no-edit --strategy-option theirs

# АБО якщо потрібно повністю замінити dev на main:
# git reset --hard origin/main

# Відправити на GitHub
git push origin dev --force-with-lease
```

## Або запустіть скрипт

**Windows:** Подвійний клік на `COPY_ALL_FROM_MAIN.bat`

**Git Bash:** 
```bash
bash copy_all_from_main.sh
```

## Примітка

- `--strategy-option theirs` - при конфліктах використовує версії з main
- `--force-with-lease` - безпечний спосіб force push (перезаписує тільки якщо ніхто інший не змінив гілку)


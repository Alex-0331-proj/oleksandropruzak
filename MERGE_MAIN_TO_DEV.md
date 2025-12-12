# Перенесення змін з main у dev

## Команди для виконання вручну

```bash
cd lab5

# Перевірити поточну гілку
git branch --show-current

# Перейти на гілку dev
git checkout dev

# Злити зміни з main
git merge main --no-edit

# Відправити на GitHub
git push origin dev
```

## Або запустіть скрипт

**Windows:** Подвійний клік на `MERGE_MAIN_TO_DEV.bat`

**Git Bash:** 
```bash
bash merge_main_to_dev.sh
```


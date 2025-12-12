# Інструкція для виконання лабораторної роботи №6

## Крок 1: Підготовка репозиторію

1. Створіть новий репозиторій на GitHub або використайте існуючий
2. Клонуйте репозиторій локально:
```bash
git clone https://github.com/Alex-0331-proj/oleksandropruzak.git
cd oleksandropruzak
```

## Крок 2: Додавання Workflow файлу

1. Створіть структуру папок:
```bash
mkdir -p .github/workflows
```

2. Створіть файл `.github/workflows/ci.yml` з кодом workflow (див. lab6_report.html)

## Крок 3: Налаштування репозиторію

1. Додайте файли до Git:
```bash
git add .
git commit -m "Add CI/CD workflow"
```

2. Створіть гілку dev (якщо потрібно):
```bash
git checkout -b dev
git push -u origin dev
```

3. Push змін:
```bash
git push origin main
```

## Крок 4: Перевірка Workflow

1. Перейдіть на GitHub у розділ "Actions"
2. Перевірте, що workflow запустився
3. Дочекайтеся завершення виконання
4. Перевірте розділ "Releases" - має з'явитися автоматичний реліз

## Крок 5: Тестування

1. Внесіть будь-які зміни у код
2. Зробіть commit та push:
```bash
git add .
git commit -m "Test workflow"
git push origin main
```

3. Перевірте, що workflow запустився автоматично
4. Перевірте створення нового релізу

## Крок 6: Створення звіту

1. Зробіть скріншоти:
   - Успішного виконання workflow
   - Деталей виконання кроків
   - Створеного релізу
   
2. Додайте скріншоти до lab6_report.html
3. Заповніть всі розділи звіту


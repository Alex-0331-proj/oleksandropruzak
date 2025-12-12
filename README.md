# SmartNotes - Інструкція користувача

## Опис

SmartNotes - це простий додаток для керування нотатками з підтримкою тегів, пошуку та графічного інтерфейсу.

## Встановлення

### Вимоги
- Python 3.11 або новіша версія
- Операційна система: Windows, Linux або macOS

### Крок 1: Завантаження
1. Завантажте або клонуйте репозиторій:
   ```bash
   git clone https://github.com/Alex-0331-proj/oleksandropruzak.git
   cd oleksandropruzak
   ```

### Крок 2: Встановлення залежностей
```bash
python -m venv .venv
source .venv/Scripts/activate  # Windows PowerShell
# або
source .venv/bin/activate  # Linux/Mac
pip install -r requirements.txt
```

## Використання

### Консольний інтерфейс (CLI)

#### Додавання нотатки
```bash
python -m smartnotes.app add --title "Назва нотатки" --body "Текст нотатки" --tags тег1 тег2
```

**Приклад:**
```bash
python -m smartnotes.app add --title "Звіт" --body "Оновити лаб4" --tags uni urgent
```

#### Перегляд нотаток
```bash
# Всі нотатки
python -m smartnotes.app list

# Нотатки з певним тегом
python -m smartnotes.app list --tag urgent
```

#### Пошук нотаток
```bash
python -m smartnotes.app search "ключове слово"
```

**Приклад:**
```bash
python -m smartnotes.app search "звіт"
```

#### Видалення нотатки
```bash
python -m smartnotes.app delete <note_id>
```

**Приклад:**
```bash
python -m smartnotes.app delete 1
```

### Графічний інтерфейс (GUI)

Запустіть графічний інтерфейс:
```bash
python -m smartnotes.gui
```

#### Можливості GUI:
- **Фільтрація за тегом** - використовуйте випадаючий список для фільтрації нотаток
- **Миттєвий пошук** - введіть ключове слово в поле пошуку
- **Додавання нотаток** - натисніть кнопку "Додати" та заповніть форму
- **Редагування нотаток** - виберіть нотатку зі списку та натисніть "Редагувати"
- **Видалення нотаток** - виберіть нотатку та натисніть "Видалити"
- **Копіювання тексту** - натисніть "Копіювати" для копіювання тексту нотатки в буфер обміну

## Зберігання даних

Всі нотатки автоматично зберігаються у файлі `data/notes.json`. Файл створюється автоматично при першому додаванні нотатки.

## Приклади використання

### Приклад 1: Створення списку справ
```bash
python -m smartnotes.app add --title "Купити продукти" --tags shopping
python -m smartnotes.app add --title "Підготувати звіт" --tags work urgent
python -m smartnotes.app add --title "Зустріч з командою" --tags work meeting
```

### Приклад 2: Пошук робочих нотаток
```bash
python -m smartnotes.app list --tag work
```

### Приклад 3: Пошук за ключовим словом
```bash
python -m smartnotes.app search "звіт"
```

## Вирішення проблем

### Помилка: "No module named 'smartnotes'"
**Рішення:** Переконайтеся, що ви знаходитесь в правильній директорії та активовано віртуальне середовище.

### Помилка: "File not found: data/notes.json"
**Рішення:** Файл створиться автоматично при першому додаванні нотатки. Якщо помилка повторюється, створіть папку `data` вручну.

### GUI не відкривається
**Рішення:** Переконайтеся, що встановлено Tkinter (зазвичай входить до складу Python).

## Підтримка

Якщо у вас виникли питання або проблеми, створіть issue в репозиторії GitHub.

## Ліцензія

Цей проект розроблено в навчальних цілях.


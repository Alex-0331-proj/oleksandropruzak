# SmartNotes - CI/CD Laboratory Work

Мінімальний консольний застосунок для керування нотатками з налаштованим CI/CD workflow.

## Можливості

* Додавання нотаток із тегами
* Перегляд усіх нотаток або фільтр за тегом
* Пошук за ключовими словами
* Видалення нотаток

## CI/CD Workflow

Проект налаштований з GitHub Actions для автоматичної збірки та створення релізів.

### Workflow файл: `.github/workflows/ci.yml`

Workflow виконує наступні кроки:
1. **Checkout code** - отримує код з репозиторію
2. **Show author info** - виводить інформацію про автора коміту
3. **Setup Python** - налаштовує Python середовище
4. **Install dependencies** - встановлює залежності
5. **Build project** - компілює проект
6. **Run tests** - запускає тести
7. **Create GitHub Release** - створює автоматичний реліз

### Запуск Workflow

Workflow автоматично запускається при:
- Push в гілку `main`
- Push в гілку `dev`

## Встановлення

```bash
python -m venv .venv
source .venv/Scripts/activate  # Windows PowerShell
pip install -r requirements.txt
```

## Використання

### CLI

```bash
python -m smartnotes.app add --title "Звіт" --body "Оновити лаб4" --tags uni urgent
python -m smartnotes.app list
python -m smartnotes.app search "звіт"
python -m smartnotes.app delete <note_id>
```

### Графічний інтерфейс (Tkinter)

```bash
python -m smartnotes.gui
```

## Структура проекту

```
lab5/
├── .github/
│   └── workflows/
│       └── ci.yml          # GitHub Actions workflow
├── smartnotes/
│   ├── app.py              # CLI додаток
│   └── gui.py              # GUI додаток
├── data/
│   └── notes.json          # Файл зберігання нотаток
├── scripts/                # Допоміжні скрипти
├── requirements.txt        # Залежності Python
└── README.md              # Документація
```


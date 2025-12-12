"""
SmartNotes CLI Application
Мінімальний консольний застосунок для керування нотатками
"""

import json
import os
import argparse
from pathlib import Path
from datetime import datetime

DATA_DIR = Path(__file__).parent.parent / "data"
DATA_DIR.mkdir(exist_ok=True)
NOTES_FILE = DATA_DIR / "notes.json"


def load_notes():
    """Завантажити нотатки з файлу"""
    if NOTES_FILE.exists():
        with open(NOTES_FILE, 'r', encoding='utf-8') as f:
            return json.load(f)
    return []


def save_notes(notes):
    """Зберегти нотатки у файл"""
    with open(NOTES_FILE, 'w', encoding='utf-8') as f:
        json.dump(notes, f, ensure_ascii=False, indent=2)


def add_note(title, body, tags):
    """Додати нову нотатку"""
    notes = load_notes()
    note = {
        'id': len(notes) + 1,
        'title': title,
        'body': body,
        'tags': tags,
        'created': datetime.now().isoformat()
    }
    notes.append(note)
    save_notes(notes)
    print(f"Нотатку додано! ID: {note['id']}")


def list_notes(tag=None):
    """Вивести список нотаток"""
    notes = load_notes()
    if tag:
        notes = [n for n in notes if tag in n.get('tags', [])]
    
    if not notes:
        print("Нотаток не знайдено.")
        return
    
    for note in notes:
        print(f"\nID: {note['id']}")
        print(f"Заголовок: {note['title']}")
        print(f"Текст: {note['body']}")
        print(f"Теги: {', '.join(note.get('tags', []))}")
        print(f"Створено: {note['created']}")


def search_notes(query):
    """Пошук нотаток за ключовими словами"""
    notes = load_notes()
    query_lower = query.lower()
    results = []
    
    for note in notes:
        if (query_lower in note['title'].lower() or 
            query_lower in note['body'].lower()):
            results.append(note)
    
    if not results:
        print(f"Нотаток за запитом '{query}' не знайдено.")
        return
    
    print(f"Знайдено {len(results)} нотаток:")
    for note in results:
        print(f"\nID: {note['id']}")
        print(f"Заголовок: {note['title']}")
        print(f"Текст: {note['body']}")


def delete_note(note_id):
    """Видалити нотатку за ID"""
    notes = load_notes()
    notes = [n for n in notes if n['id'] != note_id]
    save_notes(notes)
    print(f"Нотатку з ID {note_id} видалено.")


def main():
    parser = argparse.ArgumentParser(description='SmartNotes CLI')
    subparsers = parser.add_subparsers(dest='command', help='Команди')
    
    # Команда add
    add_parser = subparsers.add_parser('add', help='Додати нотатку')
    add_parser.add_argument('--title', required=True, help='Заголовок нотатки')
    add_parser.add_argument('--body', required=True, help='Текст нотатки')
    add_parser.add_argument('--tags', nargs='+', default=[], help='Теги')
    
    # Команда list
    list_parser = subparsers.add_parser('list', help='Список нотаток')
    list_parser.add_argument('--tag', help='Фільтр за тегом')
    
    # Команда search
    search_parser = subparsers.add_parser('search', help='Пошук нотаток')
    search_parser.add_argument('query', help='Пошуковий запит')
    
    # Команда delete
    delete_parser = subparsers.add_parser('delete', help='Видалити нотатку')
    delete_parser.add_argument('note_id', type=int, help='ID нотатки')
    
    args = parser.parse_args()
    
    if args.command == 'add':
        add_note(args.title, args.body, args.tags)
    elif args.command == 'list':
        list_notes(args.tag)
    elif args.command == 'search':
        search_notes(args.query)
    elif args.command == 'delete':
        delete_note(args.note_id)
    else:
        parser.print_help()


if __name__ == '__main__':
    main()


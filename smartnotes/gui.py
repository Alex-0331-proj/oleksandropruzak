"""
SmartNotes GUI Application
Графічний інтерфейс для керування нотатками
"""

import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext
from smartnotes.app import load_notes, save_notes, add_note, delete_note
from datetime import datetime


class SmartNotesGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("SmartNotes")
        self.root.geometry("800x600")
        
        self.setup_ui()
        self.refresh_notes()
    
    def setup_ui(self):
        # Верхня панель
        top_frame = ttk.Frame(self.root, padding="10")
        top_frame.pack(fill=tk.X)
        
        # Пошук
        ttk.Label(top_frame, text="Пошук:").pack(side=tk.LEFT, padx=5)
        self.search_var = tk.StringVar()
        self.search_var.trace('w', lambda *args: self.search_notes())
        search_entry = ttk.Entry(top_frame, textvariable=self.search_var, width=30)
        search_entry.pack(side=tk.LEFT, padx=5)
        
        # Фільтр за тегом
        ttk.Label(top_frame, text="Тег:").pack(side=tk.LEFT, padx=5)
        self.tag_var = tk.StringVar()
        tag_combo = ttk.Combobox(top_frame, textvariable=self.tag_var, width=20)
        tag_combo.pack(side=tk.LEFT, padx=5)
        tag_combo.bind('<<ComboboxSelected>>', lambda e: self.filter_by_tag())
        
        # Список нотаток
        list_frame = ttk.Frame(self.root, padding="10")
        list_frame.pack(fill=tk.BOTH, expand=True)
        
        ttk.Label(list_frame, text="Нотатки:").pack(anchor=tk.W)
        self.notes_listbox = tk.Listbox(list_frame, height=15)
        self.notes_listbox.pack(fill=tk.BOTH, expand=True)
        self.notes_listbox.bind('<<ListboxSelect>>', self.on_note_select)
        
        # Форма додавання/редагування
        form_frame = ttk.LabelFrame(self.root, text="Додати/Редагувати нотатку", padding="10")
        form_frame.pack(fill=tk.X, padx=10, pady=5)
        
        ttk.Label(form_frame, text="Заголовок:").grid(row=0, column=0, sticky=tk.W, pady=5)
        self.title_var = tk.StringVar()
        ttk.Entry(form_frame, textvariable=self.title_var, width=50).grid(row=0, column=1, pady=5)
        
        ttk.Label(form_frame, text="Текст:").grid(row=1, column=0, sticky=tk.W, pady=5)
        self.body_text = scrolledtext.ScrolledText(form_frame, width=50, height=5)
        self.body_text.grid(row=1, column=1, pady=5)
        
        ttk.Label(form_frame, text="Теги:").grid(row=2, column=0, sticky=tk.W, pady=5)
        self.tags_var = tk.StringVar()
        ttk.Entry(form_frame, textvariable=self.tags_var, width=50).grid(row=2, column=1, pady=5)
        
        # Кнопки
        button_frame = ttk.Frame(form_frame)
        button_frame.grid(row=3, column=0, columnspan=2, pady=10)
        
        ttk.Button(button_frame, text="Додати", command=self.add_note).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Видалити", command=self.delete_selected).pack(side=tk.LEFT, padx=5)
        ttk.Button(button_frame, text="Очистити", command=self.clear_form).pack(side=tk.LEFT, padx=5)
        
        self.current_note_id = None
    
    def refresh_notes(self):
        self.notes_listbox.delete(0, tk.END)
        notes = load_notes()
        for note in notes:
            self.notes_listbox.insert(tk.END, f"{note['id']}: {note['title']}")
        
        # Оновлення списку тегів
        all_tags = set()
        for note in notes:
            all_tags.update(note.get('tags', []))
        tag_combo = self.root.nametowidget(self.root.winfo_children()[0].winfo_children()[2])
        tag_combo['values'] = [''] + sorted(all_tags)
    
    def on_note_select(self, event):
        selection = self.notes_listbox.curselection()
        if not selection:
            return
        
        index = selection[0]
        notes = load_notes()
        if index < len(notes):
            note = notes[index]
            self.current_note_id = note['id']
            self.title_var.set(note['title'])
            self.body_text.delete('1.0', tk.END)
            self.body_text.insert('1.0', note['body'])
            self.tags_var.set(', '.join(note.get('tags', [])))
    
    def add_note(self):
        title = self.title_var.get().strip()
        body = self.body_text.get('1.0', tk.END).strip()
        tags_str = self.tags_var.get().strip()
        tags = [t.strip() for t in tags_str.split(',') if t.strip()]
        
        if not title or not body:
            messagebox.showwarning("Попередження", "Заповніть заголовок та текст!")
            return
        
        add_note(title, body, tags)
        self.clear_form()
        self.refresh_notes()
        messagebox.showinfo("Успіх", "Нотатку додано!")
    
    def delete_selected(self):
        if self.current_note_id is None:
            messagebox.showwarning("Попередження", "Виберіть нотатку для видалення!")
            return
        
        if messagebox.askyesno("Підтвердження", "Видалити цю нотатку?"):
            delete_note(self.current_note_id)
            self.clear_form()
            self.refresh_notes()
            messagebox.showinfo("Успіх", "Нотатку видалено!")
    
    def clear_form(self):
        self.current_note_id = None
        self.title_var.set('')
        self.body_text.delete('1.0', tk.END)
        self.tags_var.set('')
        self.notes_listbox.selection_clear(0, tk.END)
    
    def search_notes(self):
        query = self.search_var.get().lower()
        if not query:
            self.refresh_notes()
            return
        
        self.notes_listbox.delete(0, tk.END)
        notes = load_notes()
        for note in notes:
            if query in note['title'].lower() or query in note['body'].lower():
                self.notes_listbox.insert(tk.END, f"{note['id']}: {note['title']}")
    
    def filter_by_tag(self):
        tag = self.tag_var.get()
        if not tag:
            self.refresh_notes()
            return
        
        self.notes_listbox.delete(0, tk.END)
        notes = load_notes()
        for note in notes:
            if tag in note.get('tags', []):
                self.notes_listbox.insert(tk.END, f"{note['id']}: {note['title']}")


def main():
    root = tk.Tk()
    app = SmartNotesGUI(root)
    root.mainloop()


if __name__ == '__main__':
    main()


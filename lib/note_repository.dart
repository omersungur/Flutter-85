import 'package:flutter_riverpod/flutter_riverpod.dart';

class Note {
  String title;
  String description;
  bool favorite;
  bool isDone;

  Note(this.title, this.description, this.favorite, this.isDone);
}

class NotesRepository extends StateNotifier<List<Note>> {
  NotesRepository() : super([
    Note('test1title', 'test1desc', false, false),
    Note('test2title', 'test2desc', true, false),
  ]);

  void addNote(Note note) {
    state = [...state, note];
  }

  void updateNote(int index, Note note) {
    final notes = [...state];
    notes[index] = note;
    state = notes;
  }

  void removeNote(int index) {
    final notes = [...state];
    notes.removeAt(index);
    state = notes;
  }

  void toggleFavorite(int index) {
    final notes = [...state];
    notes[index].favorite = !notes[index].favorite;
    state = notes;
  }

  void toggleIsDone(int index) {
    final notes = [...state];
    notes[index].isDone = !notes[index].isDone;
    state = notes;
  }
}

final notesProvider = StateNotifierProvider<NotesRepository, List<Note>>((ref) {
  return NotesRepository();
});
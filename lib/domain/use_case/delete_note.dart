import '../model/note.dart';
import '../repository/note_repository.dart';

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<void> call (Note note)async{
    await repository.deleteNote(note);
  }
}
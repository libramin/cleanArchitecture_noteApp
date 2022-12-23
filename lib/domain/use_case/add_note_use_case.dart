import '../model/note.dart';
import '../repository/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository repository;

  AddNoteUseCase(this.repository);

  Future<void> call (Note note)async{
    await repository.insertNote(note);
  }
}
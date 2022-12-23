import '../model/note.dart';
import '../repository/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call (Note note)async{
    await repository.deleteNote(note);
  }
}
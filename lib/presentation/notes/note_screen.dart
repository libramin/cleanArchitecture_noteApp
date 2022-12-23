import 'package:flutter/material.dart';
import 'package:note_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note_app/presentation/notes/components/order_section.dart';
import 'package:note_app/presentation/notes/notes_event.dart';
import 'package:note_app/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

import '../../domain/util/note_order.dart';
import 'components/note_item.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your note',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            viewModel.onEvent(const NotesEvent.toggleOrderSection());
          }, icon: const Icon(Icons.sort)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await Navigator.push(context,
              MaterialPageRoute(builder: (_) => const AddEditNoteScreen()));

          if (isSaved != null && isSaved) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isOrderSectionVisible
                  ? OrderSection(
                      noteOrder: state.noteOrder,
                      onOrderChanged: (NoteOrder noteOrder) {
                        viewModel.onEvent(NotesEvent.changeOrder(noteOrder));
                      },
                    )
                  : Container(),
            ),
            ...state.notes
                .map((note) => GestureDetector(
                      onTap: () async {
                        bool? isSaved = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddEditNoteScreen(
                                      note: note,
                                    )));
                        if (isSaved != null && isSaved) {
                          viewModel.onEvent(const NotesEvent.loadNotes());
                        }
                      },
                      child: NoteItem(
                        note: note,
                        onDeleteTap: () {
                          viewModel.onEvent(NotesEvent.deleteNote(note));

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('노트가 삭제되었습니다'),
                            action: SnackBarAction(
                                label: '취소',
                                onPressed: () {
                                  viewModel
                                      .onEvent(const NotesEvent.restoreNote());
                                }),
                          ));
                        },
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}

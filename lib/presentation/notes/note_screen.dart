import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/ui/colors.dart';

import 'components/note_item.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your note',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                  title: 'title',
                  content: 'content',
                  color: wisteria.value,
                  timestamp: 1),
            ),
            NoteItem(
              note: Note(
                  title: 'title2',
                  content: 'content2',
                  color: skyBlue.value,
                  timestamp: 2),
            ),
          ],
        ),
      ),
    );
  }
}

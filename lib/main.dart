import 'package:flutter/material.dart';
import 'package:note_app/presentation/notes/note_screen.dart';
import 'package:note_app/ui/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'note app',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: darkGray,
        canvasColor: darkGray,
        floatingActionButtonTheme: Theme.of(context).floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.white,
          foregroundColor: darkGray
        ),
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: darkGray,
        ),
      ),
      home: const NoteScreen(),
    );
  }
}

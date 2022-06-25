import 'package:flutter/material.dart';

class NewNote extends StatelessWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'avenir'),
        home: newNote());
  }
}

class newNote extends StatefulWidget {
  const newNote({Key? key}) : super(key: key);

  @override
  State<newNote> createState() => _newNoteState();
}

class _newNoteState extends State<newNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xfff96060),
        title: Text('New Note'),
      ),
    );
  }
}

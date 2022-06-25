import 'package:flutter/material.dart';

class NewChecklist extends StatelessWidget {
  const NewChecklist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'avenir'),
        home: newChecklist());
  }
}

class newChecklist extends StatefulWidget {
  const newChecklist({Key? key}) : super(key: key);

  @override
  State<newChecklist> createState() => _newChecklistState();
}

class _newChecklistState extends State<newChecklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xfff96060),
        title: Text('New Checklist'),
      ),
    );
  }
}

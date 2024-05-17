import 'package:flutter/material.dart';
import 'media/media_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefa final D2DM1',
      home: GradeMedia(),
    );
  }
}

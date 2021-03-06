import 'package:flutter/material.dart';
import './TodoList.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primaryColor: Colors.pink[900],
      ),
      home: TodoListPage()
    );
  }
}

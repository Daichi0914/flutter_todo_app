import 'package:flutter/material.dart';
import './TodoAdd.dart';

class TodoListPage extends StatefulWidget {
  @override
  TodoListPageState createState() => TodoListPageState();
}

class TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('やること一覧'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
            },
            background: Container(
              alignment: AlignmentDirectional.centerEnd,
              color: Colors.red,
              margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
              child: ListTile(title: Text(todoList[index])),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:new1/widgets/add_task.dart';
import './widgets/task_list.dart';
import './widgets/task.dart';

void main() => (runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-do App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [
    Task(id: "1", title: "Eat", date: DateTime.now()),
    Task(id: "2", title: "Dance", date: DateTime.now()),
    Task(id: "3", title: "Play", date: DateTime.now())
  ];

  void _addTask(String title, DateTime date) {
    var newTask = Task(id: DateTime.now().toString(), title: title, date: date);
    setState(() {
      tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return AddTask(tasks, _addTask);
                    });
              },
              icon: Icon(
                Icons.add,
                size: 32,
              ))
        ],
      ),
      body: TaskList(tasks),
    );
  }
}

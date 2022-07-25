// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  TaskList(this.tasks);
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: widget.tasks.map((task) {
              return Card(
                  margin: EdgeInsets.fromLTRB(5, 11, 5, 0),
                  elevation: 3,
                  color: task.done
                      ? Color.fromARGB(255, 189, 189, 189)
                      : Color.fromARGB(255, 182, 228, 248),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                    color: task.done
                                        ? Color.fromARGB(255, 136, 131, 131)
                                        : null,
                                    // decoration:
                                    //     task.done ? TextDecoration.lineThrough : null,
                                    // decorationThickness: 2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                        // TextButton(
                        //     onPressed: () {
                        //       setState(() {
                        //         tasks.removeWhere(
                        //             (element) => element.id == task.id);
                        //       });
                        //       ;
                        //     },
                        //     // child: Icon(Icons.check_box_outline_blank_sharp),
                        Checkbox(
                            value: task.done,
                            activeColor: Colors.grey,
                            onChanged: (bool value) {
                              setState(() {
                                task.done = value;
                              });
                            }),
                      ],
                    ),
                  ));
            }).toList(),
          )),
    );
  }
}

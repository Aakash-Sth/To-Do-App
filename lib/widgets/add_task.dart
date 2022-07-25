import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './task.dart';

class AddTask extends StatefulWidget {
  final List<Task> tasks;
  Function addTask;
  AddTask(this.tasks, this.addTask);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _titleController = TextEditingController();
  DateTime _date;

  void _submit() {
    final inputTitle = _titleController.text;
    if (inputTitle.isEmpty || _date == null) {
      return;
    }
    widget.addTask(inputTitle, _date);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Task"),
              controller: _titleController,
              onSubmitted: (_) {
                _submit();
              },
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(_date == null
                  ? "No date chosen."
                  : 'Date: ${DateFormat('MMMM d, yyyy').format(_date)}'),
              FlatButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 14)))
                        .then((selectedDate) {
                      if (selectedDate == null) {
                        return;
                      }
                      setState(() {
                        _date = selectedDate;
                      });
                    });
                  },
                  child: Text("Choose Date")),
            ]),
            ElevatedButton(onPressed: _submit, child: Text("Add Task"))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Task {
  String id;
  String title;
  DateTime date;
  bool done = false;
  Task({
    @required this.id,
    @required this.title,
    @required this.date,
  });
}

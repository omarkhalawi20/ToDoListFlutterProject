import 'package:flutter/material.dart';

import 'detalied.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxChange;
  final int index;
  final DateTime date;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxChange,
      required this.index,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => Detail(index, taskTitle))),
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(value: isChecked, onChanged: checkboxChange),
      trailing: Text(date.toString()),
    );
  }
}

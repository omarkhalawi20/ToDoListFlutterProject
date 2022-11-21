import 'package:flutter/material.dart';


class DeTyle extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxChange;
   
  DeTyle(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxChange,
      
      });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      leading: Checkbox(value: isChecked, onChanged: checkboxChange),
    );
  }
}

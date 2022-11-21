import 'package:flutter/material.dart';
import 'package:todo/detalied.dart';
import 'package:todo/tasktyle.dart';
import 'package:todo/tasks.dart';

class Users extends StatefulWidget {
  Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  var users = [];
  List<Task> tasks = [];

  var task = '';
  DateTime date = DateTime.now();

  bool valuefirst = false;
  List<int> customIds = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 400,
              child: TextField(
                onChanged: (val) {
                  task = val;
                },
                decoration: InputDecoration(
                  hintText: "write your Task",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 199, 194, 194)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(Duration(days: 1)),
                    lastDate: DateTime.now().add(Duration(days: 1095)),
                  ).then((value) {
                    setState(() {
                      date = value!;
                    });
                  });
                },
                child: Icon(Icons.date_range)),
            SizedBox(
              height: 10,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    tasks.add(Task(name: task, date: date));
                  });
                },
                child: Text("Add Task"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = tasks[index];
                  return Card(
                    child: TaskTile(
                        isChecked: tasks[index].isDone,
                        taskTitle: tasks[index].name,
                        checkboxChange: (a) {
                          setState(() {
                            tasks[index].doneChange();
                          });
                        },
                        index: index,
                        date: tasks[index].date),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

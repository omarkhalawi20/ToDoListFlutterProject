import 'package:flutter/material.dart';
import 'package:todo/taskdata.dart';
import 'package:todo/tasktyle.dart';
import 'package:todo/tasks.dart';

import 'detailtyle.dart';

class Detail extends StatefulWidget {
  final int index;
  final String taskTitle;
  Detail(this.index, this.taskTitle);

  @override
  State<Detail> createState() => _MyWidgetState();
}

List<Task> tasks = [];
String task = ''; 
DateTime date = DateTime.utc(1);

class _MyWidgetState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 211, 245),
      body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back)),
                      Text(
                        "Inbox",
                        style: TextStyle(fontSize: 25),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.expand_more_outlined))
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.taskTitle}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  onChanged: (val) {
                    task = val;
                  },
                  decoration: InputDecoration(
                    hintText: "Description",
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 199, 194, 194)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tasks.add(Task(name: task, date: date));
                    });
                  },
                  child: Text("Add sub task"),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = tasks[index];
                        return Column(
                          children: [
                            DeTyle(
                              isChecked: tasks[index].isDone,
                              taskTitle: tasks[index].name,
                              checkboxChange: (a) {
                                setState(() {
                                  tasks[index].doneChange();
                                });
                              },
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ],
          )),
    );
  }
}

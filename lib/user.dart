import 'dart:html';

import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
 
  var users = [];

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
              // height: 30,
              // width: 80,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    users.add(task);
                    task = '';
                  });
                },
                // child: Icon(Icons.send_outlined),
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
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = users[index];
                  return Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    margin: EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.white70,
                          child: Row(
                            children: [
                              Checkbox(
                                value: valuefirst,
                                onChanged: (value) {
                                  setState(() {
                                    valuefirst = value!;
                                  });
                                },
                              ),
                              Text(
                                item.toString(),
                                style: TextStyle(),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(date.toString().substring(0, 11))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

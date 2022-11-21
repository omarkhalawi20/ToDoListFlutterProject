import 'package:flutter/material.dart';
import 'package:todo/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'To Do App',
            ),
            backgroundColor: Color.fromARGB(255, 221, 115, 15),
          ),
          drawer: Drawer(),
          backgroundColor: Color.fromARGB(255, 191, 211, 245),
          body: Users()),
    );
  }
}

import 'package:sqflite/sqflite.dart'; // sqflite for database
import 'package:path/path.dart'; // the path package
import 'package:todo/tasks.dart';

class DatabaseConnect {
  Database? _database;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'todo.db';
    final path = join(dbpath, dbname);

    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    // make sure the columns we create in our table match the todo_model field.
    await db.execute('''
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER
      )
    ''');
  }

  // function to add data into our database
  Future<void> insertTodo(Todo todo) async {
    // get the connection to database
    final db = await database;
    // insert the todo
    await db.insert(
      'todo', // the name of our table
      todo.toMap(), // the function we created in our todo_model
      conflictAlgorithm:
          ConflictAlgorithm.replace, // this will replace the duplicate entry
    );
  }

  // function to delete a  todo from our database
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    // delete the todo from database based on its id.
    await db.delete(
      'todo',
      where: 'id == ?', // this condition will check for id in todo list
      whereArgs: [todo.id],
    );
  }

  // function to fetch all the todo data from our database
  Future<List<Todo>> getTodo() async {
    final db = await database;
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    ); 

    return List.generate(
      items.length,
      (i) => Todo(
        id: items[i]['id'],
        title: items[i]['title'],
        creationDate: DateTime.parse(items[i][
            'creationDate']), 
        isChecked: items[i]['isChecked'] == 1
            ? true
            : false, // this will convert the Integer to boolean. 1 = true, 0 = false.
      ),
    );
  }


  // function for updating a todo in todoList
  Future<void> updateTodo(int id, String title) async {
    final db = await database;

    await db.update(
      'todo', // table name
      {
        //
        'title': title, // data we have to update
      }, //
      where: 'id == ?', // which Row we have to update
      whereArgs: [id],
    );
  }
}
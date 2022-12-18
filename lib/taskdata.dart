class Task {
  final String name;
  bool isDone;
  DateTime date;
  Task({required this.name, this.isDone = false, required this.date});
  void doneChange() {
    isDone = !isDone;
  }
}
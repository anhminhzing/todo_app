class Task{
  String task;
  bool isDone;
  Task({this.task, this.isDone});

  factory Task.fromJson(Map<String, dynamic> json){
    return Task(
      task: json['task'] as String,
      isDone: json['isDone'] as bool,
    );
  }

  @override
  bool operator ==(other) {
    return (other is Task)
        && other.task == task
        && other.isDone == isDone;
  }
}

class ToDoItem {
  String title;
  String description;
  List<Task> listTask;
  ToDoItem({this.title, this.description, this.listTask});

  factory ToDoItem.fromJson(Map<String, dynamic> json){
    return ToDoItem(
      title: json['title'] as String,
      description: json['description'] as String,
      listTask:  (json['listTask'] as List).map((e) {
        return Task.fromJson(e as Map<String, dynamic>);
      }).toList()
    );
  }

  @override
  bool operator ==(other) {
    return (other is ToDoItem)
        && other.title == title
        && other.description == description
        && other.listTask == listTask;
  }

  @override
  String toString() {
    print('$title');
    return super.toString();
  }
}

class ToDoList {
  List<ToDoItem> listItems;

  ToDoList({this.listItems});
  factory ToDoList.fromJson(Map<String, dynamic> json){
    return ToDoList(
      listItems: (json['listItems'] as List).map((e) {
        return ToDoItem.fromJson(e as Map<String, dynamic>);
      }).toList()
    );
  }

}

class MockData{
  static List<ToDoItem> mockList = [];
}



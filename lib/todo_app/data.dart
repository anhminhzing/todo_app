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

List<ToDoItem> listToDo = [
  ToDoItem(
    title: 'Wake up early 1',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ultrices tempus leo, ut volutpat nisi bibendum eu. Aliquam erat volutpat. Phasellus vestibulum sem ex, et euismod diam auctor in. Phasellus nec rhoncus ligula. Pellentesque volutpat purus quam. Nam vehicula accumsan quam non pharetra. Sed faucibus tempus dui et scelerisque. Sed ut gravida velit, id egestas mauris. Ut id posuere nulla. In ac lorem sem. Nam quis eros semper nibh iaculis mattis id et ex. Curabitur eleifend quam at magna maximus elementum. Suspendisse eros leo, finibus ut porttitor a, scelerisque sed est. Sed maximus turpis auctor nulla faucibus faucibus. Duis est dolor, convallis vitae neque ut, cursus congue orci. Pellentesque eget tortor faucibus orci venenatis tincidunt eget eu quam.',
    listTask: [
      Task(task: 'Work 1.1', isDone: false),
      Task(task: 'Work 1.2', isDone: true),
      Task(task: 'Work 1.3', isDone: false),
    ]
  ),
  ToDoItem(
    title: 'Wake up early 2',
    description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ultrices tempus leo, ut volutpat nisi bibendum eu. Aliquam erat volutpat. Phasellus vestibulum sem ex, et euismod diam auctor in. Phasellus nec rhoncus ligula. Pellentesque volutpat purus quam. Nam vehicula accumsan quam non pharetra. Sed faucibus tempus dui et scelerisque. Sed ut gravida velit, id egestas mauris. Ut id posuere nulla. In ac lorem sem. Nam quis eros semper nibh iaculis mattis id et ex. Curabitur eleifend quam at magna maximus elementum. Suspendisse eros leo, finibus ut porttitor a, scelerisque sed est. Sed maximus turpis auctor nulla faucibus faucibus. Duis est dolor, convallis vitae neque ut, cursus congue orci. Pellentesque eget tortor faucibus orci venenatis tincidunt eget eu quam.',
    listTask: [
      Task(task: 'Work 2.1', isDone: false),
      Task(task: 'Work 2.2', isDone: true),
    ]
  ),
  ToDoItem(
    title: 'Wake up early 3',
    description:
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ultrices tempus leo, ut volutpat nisi bibendum eu. Aliquam erat volutpat. Phasellus vestibulum sem ex, et euismod diam auctor in. Phasellus nec rhoncus ligula. Pellentesque volutpat purus quam. Nam vehicula accumsan quam non pharetra. Sed faucibus tempus dui et scelerisque. Sed ut gravida velit, id egestas mauris. Ut id posuere nulla. In ac lorem sem. Nam quis eros semper nibh iaculis mattis id et ex. Curabitur eleifend quam at magna maximus elementum. Suspendisse eros leo, finibus ut porttitor a, scelerisque sed est. Sed maximus turpis auctor nulla faucibus faucibus. Duis est dolor, convallis vitae neque ut, cursus congue orci. Pellentesque eget tortor faucibus orci venenatis tincidunt eget eu quam.',
    listTask: [
      Task(task: 'Work 3.1', isDone: false),
      Task(task: 'Work 3.2', isDone: true),
      Task(task: 'Work 3.3', isDone: false),
    ]
  ),
];

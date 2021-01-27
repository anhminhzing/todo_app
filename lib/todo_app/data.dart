class Task{
  String task;
  bool isDone;
  Task({this.task, this.isDone});

  Task.fromJson(Map<String, dynamic> json){
    task = json['task'];
    isDone = json['isDone'];
  }
}

class ToDoItem {
  String title;
  String description;
  List<Task> listTask;
  ToDoItem({this.title, this.description, this.listTask});

  ToDoItem.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    listTask = (json['listTask'] as List).map((e){
      Task.fromJson(e as Map<String, dynamic>);
    }).toList();
  }
}

class ToDoList {
  List<ToDoItem> listItems;

  ToDoList({this.listItems});
  ToDoList.fromJson(Map<String, dynamic> json){
    listItems = (json['listItems'] as List ).map((e){
      ToDoItem.fromJson(e as Map<String, dynamic>);
    }).toList();
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

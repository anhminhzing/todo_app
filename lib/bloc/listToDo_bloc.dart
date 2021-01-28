import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/todo_app/data.dart';
import 'package:rxdart/rxdart.dart' show BehaviorSubject;

enum ResponseState {
  loading,
  done,
}

class ToDoBloc {
  // ignore: close_sinks
  final BehaviorSubject<ResponseState> listItemController = BehaviorSubject<
      ResponseState>();

  Stream<ResponseState> get getListItemController =>
      this.listItemController.stream;

  List<ToDoItem> listToDo;

  Future<void> getData() async {
    listItemController.sink.add(ResponseState.loading);
    String data = await rootBundle.loadString('assets/data/data.json');
    var x = json.decode(data);
    ToDoList _listToDo = ToDoList.fromJson(x);
    listToDo = _listToDo.listItems;
    listItemController.sink.add(ResponseState.done);
  }

  void fixData(int index, String title, String description)  {
    listItemController.sink.add(ResponseState.loading);
    ToDoItem newItem = ToDoItem(
      title: title,
      description: description,
      listTask: []
    );
    listToDo[index] = newItem;
    listItemController.sink.add(ResponseState.done);
  }

  void addTask(ToDoItem item, Task newTask){
    listItemController.sink.add(ResponseState.loading);
    listToDo.forEach((element) {
      if(item == element){
        element.listTask.add(newTask);
      }
    });
    listItemController.sink.add(ResponseState.done);
  }

  void addToDo(ToDoItem newItem){
    listItemController.sink.add(ResponseState.loading);
    listToDo.add(newItem);
    listItemController.sink.add(ResponseState.done);
  }

  void changeStateDone(ToDoItem item, bool state, Task taskItem){
    listItemController.sink.add(ResponseState.loading);
    listToDo.forEach((element) {
      if(item == element){
        element.listTask.forEach((elementTask) {
          if (elementTask == taskItem){
            elementTask.isDone = state;
          }
        });
      }
    });
    listItemController.sink.add(ResponseState.loading);
  }

  void init(){
    print('get data');
    getData();
  }

  void dispose() {
    listItemController?.close();
  }
}

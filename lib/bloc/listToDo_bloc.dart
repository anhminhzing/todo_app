import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_app/todo_app/data.dart';
import 'package:rxdart/rxdart.dart' show BehaviorSubject;

enum ResponseState {
  loading,
  done,
}

class ToDoBloc {
  // ignore: close_sinks
  final BehaviorSubject<ResponseState> listItemController =
      BehaviorSubject<ResponseState>();

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

  void setList() {
    listItemController.sink.add(ResponseState.loading);
    listItemController.sink.add(ResponseState.done);
  }

  void init() {
    getData();
  }

  void dispose() {
    listItemController?.close();
  }
}

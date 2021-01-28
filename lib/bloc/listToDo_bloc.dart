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

  ToDoList _list;

  Future<void> getData() async {
    listItemController.sink.add(ResponseState.loading);
    String data = await rootBundle.loadString('assets/data/data.json');
    var x = json.decode(data);
    _list = ToDoList.fromJson(x);
    listItemController.sink.add(ResponseState.done);
  }

  void init(){
    print('get data');
    getData();
  }

  void dispose() {
    listItemController?.close();
  }
}

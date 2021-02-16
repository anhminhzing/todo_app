import 'dart:convert';
import 'package:flutter_app/data/user_data.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class UserBloc {
  // ignore: close_sinks
  BehaviorSubject<Result> userBloc = BehaviorSubject<Result>();
  BehaviorSubject<Result> get userBlocStream => this.userBloc.stream;
  Future<void> getData() async {
    String url = 'https://randomuser.me/api/?results=10';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Result responseJS = Result.fromJson(json.decode(response.body));
      print(responseJS.toString());
      userBloc.sink.add(responseJS);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      userBloc.sink.addError('error');
    }
  }

  void init() {
    getData();
  }

  void dispose() {
    this.userBloc.close();
  }
}

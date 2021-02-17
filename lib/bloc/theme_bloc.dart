import 'package:flutter/material.dart';
import 'package:flutter_app/theme/themedata.dart';
import 'package:rxdart/rxdart.dart';

class ThemeBloc {
  // ignore: close_sinks
  BehaviorSubject<ThemeData> themeBloc = BehaviorSubject<ThemeData>();
  BehaviorSubject<ThemeData> get themeBlocStream => this.themeBloc.stream;
  Future<void> getLightTheme() async {
    this.themeBloc.sink.add(DataTheme.lightTheme);
  }

  Future<void> getDarkTheme() async {
    this.themeBloc.sink.add(DataTheme.darkTheme);
  }

  void dispose() {
    this.themeBloc.close();
  }
}

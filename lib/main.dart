import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/theme_bloc.dart';
import 'package:flutter_app/screens/listUsers_screen.dart';
import 'package:flutter_app/theme/themedata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeBloc _bloc = ThemeBloc();
  bool isLight;
  @override
  void initState() {
    _bloc = ThemeBloc();
    isLight = true;
    super.initState();
  }

  void changeTheme() {
    isLight = !isLight;
    if (isLight) {
      _bloc.getLightTheme();
    } else {
      _bloc.getDarkTheme();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      stream: _bloc.themeBlocStream,
      initialData: DataTheme.lightTheme,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: snapshot.data,
            home: ListUser(changeTheme: () => changeTheme()),
          );
        }
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: DataTheme.darkTheme,
          home: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

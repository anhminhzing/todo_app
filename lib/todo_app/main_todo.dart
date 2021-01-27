import 'package:flutter/material.dart';
import 'package:flutter_app/todo_app/card_item.dart';
import 'package:flutter_app/todo_app/data.dart';

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: List.generate(listToDo.length, (int index){
                    return CardItem(
                      title: listToDo[index].title,
                      description: listToDo[index].description,
                    );
                  }).toList()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

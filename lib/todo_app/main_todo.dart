import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/listToDo_bloc.dart';
import 'package:flutter_app/todo_app/card_item.dart';
import 'package:flutter_app/todo_app/data.dart';
import 'package:flutter_app/todo_app/page_screen.dart';

class ToDoApp extends StatefulWidget {
  @override
  _ToDoAppState createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  ToDoBloc blocController;

  @override
  void initState() {
    blocController = ToDoBloc()..init();
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
                child: StreamBuilder<ResponseState>(
                  stream: blocController.getListItemController,
                  builder: (BuildContext context,
                      AsyncSnapshot<ResponseState> snapshot) {
                    switch (snapshot.data) {
                      case ResponseState.loading:
                        return Center(
                          child: Text('Loading'),
                        );
                        break;
                      case ResponseState.done:
                        return Column(
                          children: List.generate(
                              blocController.listToDo.length, (index) {
                            return CardItem(
                              title: blocController.listToDo[index].title,
                              description:
                                  blocController.listToDo[index].description,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PageScreen(
                                        item: blocController.listToDo[index]),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        );
                        break;
                      default:
                        return Center(
                          child: Text('Don\'t have data'),
                        );
                        break;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     // Add your onPressed code here!
        //   },
        //   label: Text('Add'),
        //   icon: Icon(Icons.add),
        //   backgroundColor: Colors.pink,
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageScreen()
              ),
            );
          },
          child:  Icon(Icons.add, color: Colors.white,size: 30,),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

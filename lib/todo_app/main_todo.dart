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
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  void initState() {
    blocController = ToDoBloc()..init();
    super.initState();
  }

  @override
  void dispose() {
    blocController?.dispose();
    super.dispose();
  }

  void addNewItem() {
    ToDoItem newItem = ToDoItem(
        title: titleController.text.trim() == ''
            ? '[empty title]'
            : titleController.text,
        description: desController.text.trim() == ''
            ? '[empty description]'
            : desController.text,
        listTask: []);

    MockData.mockList.add(newItem);
    titleController.clear();
    desController.clear();
    blocController.setList();
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF242A37),
          title: Text(
            "Add new",
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                maxLines: 1,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'New title for new task',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: desController,
                maxLines: 3,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'New description for new task',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.0),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: () {
                addNewItem();
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
                titleController.clear();
                desController.clear();
              },
              child: Text('Close'),
            )
          ],
        );
      },
    );
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
              color: Color(0xFF242A37),
            ),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [
                            0.0,
                            1.0,
                          ],
                          colors: [
                            Colors.pink,
                            Color(0xFFFF9500),
                          ],
                        ),
                      ),
                      child: Text(
                        'ToDo List',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    StreamBuilder<ResponseState>(
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
                            if (MockData.mockList.isEmpty) {
                              MockData.mockList = blocController.listToDo;
                            }
                            blocController.setList();
                            return Column(
                              children: List.generate(MockData.mockList.length,
                                  (index) {
                                return CardItem(
                                  title: MockData.mockList[index].title,
                                  description:
                                      MockData.mockList[index].description,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PageScreen(
                                            item: MockData.mockList[index]),
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
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [
                    0.0,
                    1.0,
                  ],
                  colors: [
                    Colors.pink,
                    Color(0xFFFF9500),
                  ],
                ),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              )),
        ),
      ),
    );
  }
}

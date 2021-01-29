import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/listToDo_bloc.dart';
import 'package:flutter_app/todo_app/data.dart';

class PageScreen extends StatefulWidget {
  final ToDoItem item;
  final ToDoBloc bloc;

  PageScreen({Key key, this.item, this.bloc}) : super(key: key);

  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController taskController = TextEditingController();

  List<Task> listTask;

  @override
  void initState() {
    titleController.text = widget.item?.title ?? '';
    desController.text = widget.item?.description ?? '';
    listTask = widget.item?.listTask ?? [];
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
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
                      GestureDetector(
                        onTap: () {
                          ToDoItem newItem = ToDoItem(
                              title: titleController.text.trim() == ''
                                  ? '[empty title]'
                                  : titleController.text,
                              description: desController.text.trim() == ''
                                  ? '[empty description]'
                                  : desController.text,
                              listTask: listTask);
                          int index = MockData.mockList.indexOf(widget.item);
                          MockData.mockList[index] = newItem;
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextField(
                        controller: titleController,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'New title for new task',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: TextField(
                          controller: desController,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'New description for new task',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: List.generate(listTask.length, (index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: Color(0xFF242A37),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Checkbox(
                                  activeColor: Colors.green,
                                  checkColor: Colors.white,
                                  value: listTask[index].isDone,
                                  onChanged: (newValue) {
                                    setState(() {
                                      listTask[index].isDone =
                                          !listTask[index].isDone;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    listTask[index].task,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF242A37),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Expanded(
                        child: TextField(
                          controller: taskController,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: 'New task',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onEditingComplete: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              var newTask = Task(
                                task: taskController.text,
                                isDone: false,
                              );
                              taskController.text.trim() != ''
                                  ? listTask.add(newTask)
                                  : null;
                              taskController.clear();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

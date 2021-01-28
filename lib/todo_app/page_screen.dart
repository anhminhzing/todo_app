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
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ToDoItem newItem = ToDoItem(
                              title: titleController.text.trim() == '' ? '[new title]' : titleController.text,
                              description: desController.text.trim() == '' ? '[new title]' : desController.text,
                              listTask: listTask
                            );
                            widget.bloc.addToDo(newItem);
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: titleController,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'New title for new task',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: TextField(
                        controller: desController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'New description for new task',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: List.generate(listTask.length, (index) {
                        return CheckboxListTile(
                          title: Text(listTask[index].task),
                          value: listTask[index].isDone,
                          onChanged: (newValue) {
                            setState(() {
                              listTask[index].isDone = !listTask[index].isDone;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Expanded(
                        child: TextField(
                          controller: taskController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'New task',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onEditingComplete: (){

                            setState(() {
                              FocusScope.of(context).unfocus();
                              var newTask = Task(
                                task: taskController.text,
                                isDone: false,
                              );
                              listTask.add(newTask);
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

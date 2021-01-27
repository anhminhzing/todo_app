import 'package:flutter/material.dart';

class PageScreen extends StatefulWidget {
  @override
  _PageScreenState createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {

  TextEditingController titleController =  TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  void initState() {
    titleController.text = 'Wake up';
    desController.text = 'des';
    print('init');
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
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
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
                color: Colors.red,
                child: TextField(
                  controller: desController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

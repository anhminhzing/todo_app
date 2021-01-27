import 'package:flutter/material.dart';
import 'package:flutter_app/todo_app/page_screen.dart';

class CardItem extends StatefulWidget {
  final String title;
  final String description;
  final bool isDone;

  CardItem({Key key, this.title, this.description, this.isDone,})
      : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isDone;

  @override
  void initState() {
    isDone = widget.isDone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageScreen()),
        );
      },
      child:  Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          width: double.infinity,
          height: 100,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
              ),
              SizedBox(height: 10,),
              Text(
                widget.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final bool value;
  final VoidCallback onChange;
  CheckBox({
    Key key,
    this.value,
    this.onChange,
  }) :super(key : key);
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}

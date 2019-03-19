import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      foregroundColor: Colors.white,
      backgroundColor: Color.fromRGBO(255, 78, 82, 1),
    );
  }
}
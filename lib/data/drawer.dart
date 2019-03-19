import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 150.0, 0.0, 0.0),
      children: <Widget>[
        ListTile(
          title: Text(
            'График тренировок',
            style: TextStyle(
              color: Color.fromRGBO(0, 211, 144, 1),
              fontSize: 18.0,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            'Мои клиенты',
            style: TextStyle(
                color: Color.fromRGBO(0, 211, 144, 1), fontSize: 18.0),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            'Мои финансы',
            style: TextStyle(
                color: Color.fromRGBO(0, 211, 144, 1), fontSize: 18.0),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text(
            'Программа тренировок',
            style: TextStyle(
                color: Color.fromRGBO(0, 211, 144, 1), fontSize: 18.0),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
import 'package:fitnes/data/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSelected extends StatelessWidget {
  const UserSelected({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            disabledColor: Colors.white,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Text(
              'Перенести',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline),
            alignment: Alignment.centerRight,
            color: Colors.red,
            disabledColor: Colors.white,
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              'Удалить',
              style: TextStyle(fontSize: 18.0, color: Colors.red),
            ),
          )
        ],
      );
  }
}

class UserName extends StatelessWidget {
  const UserName({
    Key key,
    @required this.user,
  }) : super(key: key);

  final Photo user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
          child: Container(
            width: MediaQuery.of(context).size.width/3,
            child: Text(
              '${user.name}',
              style: TextStyle(
                  fontSize: 18.0, color: Colors.grey[500]),
            ),
            
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
          child: Text(
            'с 10:30 до 11:20 ',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
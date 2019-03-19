import 'package:fitnes/data/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotosList extends StatefulWidget {
  final List<Photo> photos;
  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  PhotosListState createState() => PhotosListState();
}

class PhotosListState extends State<PhotosList> {
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: widget.photos.length,
      itemBuilder: (context, index) {
        var user = widget.photos[index];
        return Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 15, 45, 15),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user.photo),
                            radius: 30,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                              child: Text(
                                '${user.name}',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey[500]),
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
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 1, 0, 1),
                          child: Checkbox(
                            value: user.isSelected,
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            onChanged: (bool value) {
                              setState(() {
                                user.isSelected = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            user.isSelected
                ? Row(
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
                  )
                : Row(),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }
}

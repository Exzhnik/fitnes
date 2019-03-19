import 'package:fitnes/data/add_button.dart';
import 'package:fitnes/data/drawer.dart';
import 'package:fitnes/data/future.dart';
import 'package:fitnes/data/list_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'data/user.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Fitness',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color.fromRGBO(255, 78, 82, 1),
          accentColor: Colors.white,
          canvasColor: const Color(0xFFfafafa),
          fontFamily: 'Merriweather',
        ),
        home: DefaultTabController(
          length: 9,
          child: Scaffold(
            appBar: new AppBar(
              title: Center(
                child: Text('Тренировка ноябрь'),
              ),
              bottom: TabBar(
                indicatorPadding: EdgeInsets.all(0.0),
                indicatorWeight: 3.0,
                isScrollable: true,
                labelStyle:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                labelPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                tabs: <Widget>[
                  Text("1 пт"),
                  Text("2 сб"),
                  Text("3 вс"),
                  Text("4 пн"),
                  Text("5 вт"),
                  Text("6 ср"),
                  Text("7 чт"),
                  Text("8 пт"),
                  Text("9 сб"),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  alignment: Alignment.centerRight,
                  disabledColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
            drawer: Drawer(
              child: new DrawerList(),
            ),
            body: new FuttureBuilder(),
            floatingActionButton: new AddButton(),
          ),
        ));
  }
}

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
                        new UserName(user: user),
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
            user.isSelected ? new UserSelected() : Row(),
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

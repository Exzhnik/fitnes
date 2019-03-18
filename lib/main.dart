import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int counter = 0;
  // bool useWidget = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Fitnes',
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
            drawer: buildDrawer(context),
            body: FutureBuilder<List<Photo>>(
              future: fetchPhotos(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? PhotosList(photos: snapshot.data)
                    : Center(child: CircularProgressIndicator());
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              foregroundColor: Colors.white,
              backgroundColor: Color.fromRGBO(255, 78, 82, 1),
            ),
          ),
        ));
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
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
      ),
    );
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
        var user =widget.photos[index];
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
                            backgroundImage:
                                NetworkImage(user.photo),
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
                            value: user.isSelected =false,
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            onChanged: (bool value) {
                              setState(() {
                                user.isSelected;
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

// class ListTest extends StatefulWidget {
//   @override
//   _ListTestState createState() => new _ListTestState();
// }

// class _ListTestState extends State<ListTest> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   int _id;
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       key: _scaffoldKey,
//       body: new ListView(
//           children: new List.generate(10, (int index){
//             return new ListTile(title: new Text("item#$index"),
//             onTap:(){
//               setState((){
//                 _id = index; //if you want to assign the index somewhere to check
//               });
//               _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("You clicked item number $_id")));
//             },
//             );
//           })

//       ),
//     );
//   }
// }

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

  Widget build(BuildContext context) {
    
    return null;
  }
}

class MyAppState extends State<MyApp> {
  List<Photo> photos;
  MyAppState({Key key, this.photos});

  
  bool useWidget = false;

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
              builder: (context, snapshot){
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 10, 0, 0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage('${photos[index].photo}'),
                                        radius: 30,
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 12.0, 12.0, 6.0),
                                          child: Text(
                                            '${photos[index].name}',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.grey[500]),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 6.0, 12.0, 12.0),
                                          child: Text(
                                            'с 10:30 до 11:20 ',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        useWidget
                                            ? Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      'Перенести',
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      'Удалить',
                                                      style: TextStyle(
                                                          fontSize: 18.0),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Row(),
                                      ],
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(35, 40, 0, 5),
                                      child: Checkbox(
                                        value: useWidget,
                                        checkColor: Colors.white,
                                        activeColor: Colors.blue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            useWidget = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              height: 2.0,
                              color: Colors.grey,
                            )
                          ],
                        );
                      });
                
                // snapshot.hasData
                //     ? MyAppState(photos: snapshot.data)
                //     : Center(child: CircularProgressIndicator());
              },
            ),

            // body: ListView.builder(

            //   itemCount: photos.length,
            //   itemBuilder: (context, index) {
            //     return Column(
            //       children: <Widget>[
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Container(
            //                   padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
            //                   child: CircleAvatar(
            //                     backgroundImage:
            //                         NetworkImage(photos[index].photo),
            //                     radius: 30,
            //                   ),
            //                 ),
            //                 Column(
            //                   children: <Widget>[
            //                     Padding(
            //                       padding: const EdgeInsets.fromLTRB(
            //                           12.0, 12.0, 12.0, 6.0),
            //                       child: Text(
            //                         '${photos[index].name}',
            //                         style: TextStyle(
            //                             fontSize: 18.0,
            //                             color: Colors.grey[500]),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.fromLTRB(
            //                           12.0, 6.0, 12.0, 12.0),
            //                       child: Text(
            //                         'с 10:30 до 11:20 ',
            //                         style: TextStyle(
            //                             fontSize: 18.0,
            //                             fontWeight: FontWeight.w700),
            //                       ),
            //                     ),
            //                     useWidget
            //                         ? Row(
            //                             children: <Widget>[
            //                               Padding(
            //                                 padding: const EdgeInsets.all(10),
            //                                 child: Text(
            //                                   'Перенести',
            //                                   style: TextStyle(fontSize: 18.0),
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding: const EdgeInsets.all(10),
            //                                 child: Text(
            //                                   'Удалить',
            //                                   style: TextStyle(fontSize: 18.0),
            //                                 ),
            //                               )
            //                             ],
            //                           )
            //                         : Row(),
            //                   ],
            //                 ),
            //                 Container(
            //                   padding: EdgeInsets.fromLTRB(35, 40, 0, 5),
            //                   child: Checkbox(
            //                     value: useWidget,
            //                     checkColor: Colors.white,
            //                     activeColor: Colors.blue,
            //                     onChanged: (bool value) {
            //                       setState(() {
            //                         useWidget = value;
            //                       });
            //                     },
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         Divider(
            //           height: 2.0,
            //           color: Colors.grey,
            //         )
            //       ],
            //     );
            //   },

            // ),
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

// class widgetSt extends StatelessWidget {
//   const widgetSt({
//     Key key,
//     @required this.useWidget,
//   }) : super(key: key);

//   final bool useWidget;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(35, 40, 0, 5),
//       child: Checkbox(
//         value: useWidget,
//         checkColor: Colors.white,
//         activeColor: Colors.blue,
//         onChanged: (bool value) {
//           setState(() {
//             useWidget = value;
//           });
//         },
//       ),
//     );
//   }
// }

// class PhotosList extends StatelessWidget {
//   bool useWidget = false;
//   final List<Photo> photos;

//   PhotosList({Key key, this.photos}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: photos.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
//                       child: CircleAvatar(
//                         backgroundImage: NetworkImage(photos[index].photo),
//                         radius: 30,
//                       ),
//                     ),
//                     Column(
//                       children: <Widget>[
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
//                           child: Text(
//                             '${photos[index].name}',
//                             style: TextStyle(
//                                 fontSize: 18.0, color: Colors.grey[500]),
//                           ),
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
//                           child: Text(
//                             'с 10:30 до 11:20 ',
//                             style: TextStyle(
//                                 fontSize: 18.0, fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                         useWidget
//                             ? Row(
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Text(
//                                       'Перенести',
//                                       style: TextStyle(fontSize: 18.0),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Text(
//                                       'Удалить',
//                                       style: TextStyle(fontSize: 18.0),
//                                     ),
//                                   )
//                                 ],
//                               )
//                               :Row(),
//                             //////
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Divider(
//               height: 2.0,
//               color: Colors.grey,
//             )
//           ],
//         );
//       },
//     );
//   }
// }

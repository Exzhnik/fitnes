import 'package:fitnes/data/user.dart';
import 'package:fitnes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class FuttureBuilder extends StatelessWidget {
  const FuttureBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Photo>>(
      future: fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? PhotosList(photos: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

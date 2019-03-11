import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Avatars>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://tinyfac.es/api/users'/*, headers: {'X-API_KEY': 'a1972d271bc13eccd285f4e123d3a3'}*/);

  return compute(parsePhotos, response.body);
}

List<Avatars> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Results>((json) => Avatars.fromJson(json)).toList();
}

class Autogenerated {
  List<Results> results;

  Autogenerated({this.results});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  List<Avatars> avatars;
  AvatarsOrigin avatarsOrigin;
  String firstName;
  String gender;
  String lastName;

  Results(
      {this.avatars,
      this.avatarsOrigin,
      this.firstName,
      this.gender,
      this.lastName});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['avatars'] != null) {
      avatars = new List<Avatars>();
      json['avatars'].forEach((v) {
        avatars.add(new Avatars.fromJson(v));
      });
    }
    avatarsOrigin = json['avatars_origin'] != null
        ? new AvatarsOrigin.fromJson(json['avatars_origin'])
        : null;
    firstName = json['first_name'];
    gender = json['gender'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatars != null) {
      data['avatars'] = this.avatars.map((v) => v.toJson()).toList();
    }
    if (this.avatarsOrigin != null) {
      data['avatars_origin'] = this.avatarsOrigin.toJson();
    }
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['last_name'] = this.lastName;
    return data;
  }
}

class Avatars {
  int height;
  String size;
  String url;
  int width;

  Avatars({this.height, this.size, this.url, this.width});

  Avatars.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    size = json['size'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['size'] = this.size;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class AvatarsOrigin {
  String facebookProfileLink;
  int id;
  String name;

  AvatarsOrigin({this.facebookProfileLink, this.id, this.name});

  AvatarsOrigin.fromJson(Map<String, dynamic> json) {
    facebookProfileLink = json['facebook_profile_link'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook_profile_link'] = this.facebookProfileLink;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
class PhotosList extends StatelessWidget {
  final List<Avatars> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].url);
      },
    );
  }
}

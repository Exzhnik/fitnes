import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get('https://uifaces.co/api?limit=10',
      headers: {'X-API-Key': 'a1972d271bc13eccd285f4e123d3a3'});

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
class Photo {
  final String name;
  final String email;
  final String position;
  final String photo;
  bool isSelected;

  Photo({this.name, this.email, this.position, this.photo, this.isSelected = false});

  factory Photo.fromJson(Map<String, dynamic> json)  {
    return Photo(
      name: json['name'] as String,
      email: json['email'] as String,
      position: json['position'] as String,
      photo: json['photo'] as String,
    );
  }
}

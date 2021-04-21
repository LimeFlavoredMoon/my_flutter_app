import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({@required this.userId, @required this.id, @required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<KakaoLogin> fetchKakaoLogin() async {
  final response = await http.get(Uri.https('kauth.kakao.com',
      'oauth/authorize?response_type=code&client_id=1bdff21fc53404570ccdbc2bbbd0a87f&redirect_uri=http://127.0.0.1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return KakaoLogin.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class KakaoLogin {
  // ignore: non_constant_identifier_names
  final String code;
  final String state;
  final String error;
  // ignore: non_constant_identifier_names
  final String error_description;

  // ignore: non_constant_identifier_names
  KakaoLogin(
      {@required this.code,
      @required this.state,
      @required this.error,
      // ignore: non_constant_identifier_names
      @required this.error_description});

  factory KakaoLogin.fromJson(Map<String, dynamic> json) {
    return KakaoLogin(
      code: json['code'],
      state: json['state'],
      error: json['error'],
      error_description: json['error_description'],
    );
  }
}

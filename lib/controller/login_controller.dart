import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_api/screens/home_screen.dart';

const BaseUrl = 'https://fakestoreapi.com/auth/login';
userLogin(username, password, context) async {
  final response = await http.post(Uri.parse(BaseUrl),
      body: {"username": username, "password": password}).whenComplete(() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  });
  print(response.body);
}

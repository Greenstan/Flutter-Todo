import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/aboutUs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',

      initialRoute: '/',
      
      theme: ThemeData(primarySwatch: Colors.green),

      routes: {
        '/': (context) =>  MyHomePage(),
        '/menu': (context) =>  Menu(),

      },

      // home: MyHomePage(),
    );
  }
  
}


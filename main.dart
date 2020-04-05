import 'package:flutter/material.dart';
import 'package:flutter_app_test/listed_routines/home.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp
    (
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      home: MainHome(),
    );
  }
}
import 'package:flutter/material.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp
    (
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            //onPressed: (),
          ),
          actions: <Widget>[

          ],//list
        ),
      ),
    );
  }
}

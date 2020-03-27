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
          backgroundColor: Colors.deepOrange,
          title: Container(
            padding: EdgeInsets.all(5.0),
            child: Text("Routines"),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            //onPressed: (),
          ),
          actions: <Widget>[

          ],//list
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrange,
        ),
        body: ListedRoutine(),
      ),
    );
  }
}

class ListedRoutine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 1, bottom: 1,left: 100),
              child: Icon(Icons.arrow_forward),
            )
          ]
        ),
      ]
    );
  }
}

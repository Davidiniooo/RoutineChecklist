import 'package:flutter/material.dart';
import 'package:flutter_app_test/globals.dart';
import 'package:flutter_app_test/listed_routines/list.dart';
import 'package:flutter_app_test/add_routine/form.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.all(5.0),
          child: Text("Routines"),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            globalAddRoutine(1, 'routineName', [2], ['stepNames']);
            showDialog(
              context: context,
              builder:(_)=> AlertDialog(
              title: Text(global_routines[0].stepNames[0]),
              )
            );
          }
        ),
        actions: <Widget>[

        ],//list
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  InputForm(),
            ),
          );
        },
      ),
      body: ListedRoutine(),
    );
  }
}

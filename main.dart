import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
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
          backgroundColor: Colors.grey,
        ),
        body: ListedRoutine(),
      ),
    );
  }
}

class ListedRoutine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context,i){
        return SingeListedRoutine();
      }
    );
  }
}

class SingeListedRoutine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.lightbulb_outline,color: Colors.orange),
      title: Text(
          'Routine1'
      ),
      trailing: IconButton(
          icon: Icon(Icons.arrow_forward,color: Colors.orange)
      ),
    );
  }
}

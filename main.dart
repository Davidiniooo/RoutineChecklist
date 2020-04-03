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
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      home: MainHome(),
    );
  }
}

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
          //onPressed: (),
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


class ListedRoutine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
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
      leading: Icon(Icons.lightbulb_outline),
      title: Text(
          'Routine1'
      ),
      trailing: IconButton(
          icon: Icon(Icons.arrow_forward)
      ),
    );
  }
}

class InputForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text("Add a new Routine"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Form(
              child:ListView(
                children: <Widget>[
                  StepInputForm(),
                  StepInputForm(),
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: Icon(Icons.add),
                    ),
                  ),
                ]
              )
            ),
          ),
          RaisedButton(onPressed: null)
        ],
      )
    );
  }
}

class StepInputForm extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            "Step1:",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
        TextFormField(
          cursorColor: Colors.grey,
        )
      ]
    );
  }
}

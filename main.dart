import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "RoutineChecklist",
    home: HomeWidget(),
    )
  );
}
class HomeWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Text("Hello World"),
    );
  }
}

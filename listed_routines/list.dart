import 'package:flutter/material.dart';
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
        onPressed: null,
          icon: Icon(Icons.arrow_forward)
      ),
    );
  }
}


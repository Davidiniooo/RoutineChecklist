import 'package:flutter/material.dart';
import 'package:flutter_app_test/globals.dart';
class ListedRoutine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: GLOBAL_LIST_ROUTINES.currentIndex,
        itemBuilder: (context,i){
          return SingeListedRoutine(i);
        }
    );
  }
}

class SingeListedRoutine extends StatelessWidget{

  int index;
  @override
  SingeListedRoutine(int i){
    index = i;
  }

  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.lightbulb_outline),
      title: Text(
          GLOBAL_LIST_ROUTINES.globalRoutines[index].routineName
      ),
      trailing: IconButton(
        onPressed: null,
          icon: Icon(Icons.arrow_forward)
      ),
    );
  }
}


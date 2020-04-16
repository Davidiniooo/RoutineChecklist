import 'package:flutter/material.dart';

class InputForm extends StatefulWidget{
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  int stepsCounter = 1;

  @override
  void addStep(){
    setState((){
      stepsCounter++;
    });
  }
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
          Form(
            child:Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: stepsCounter,
                      itemBuilder: (context, i){
                        return StepInputForm();
                      }
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      onPressed: addStep,
                      icon: Icon(Icons.add),
                    ),
                  ),
                ]
              ),
            )
          ),
          RaisedButton(
            color: Colors.green,
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("Submit")
          ),
        ],
      )
    );
  }
}
class StepInputForm extends StatefulWidget
{
  @override
  _StepInputFormState createState() => _StepInputFormState();
}

class _StepInputFormState extends State<StepInputForm> {
  final _controllerTimeInput = TextEditingController();
  int index = -1;
  String stepName;
  double stepTime = -1;


  @override
  void dispose(){
    _controllerTimeInput.dispose();
    super.dispose();
  }

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
          Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                    cursorColor: Colors.grey,
                  )
              ),
              FlatButton(
                  color: Colors.green,
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (_)=> AlertDialog(
                          title: Text("How long does this step take?"),
                          content: TextField(
                            controller: _controllerTimeInput,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Set Time"),
                              onPressed: (){
                                stepTime = double.parse(_controllerTimeInput.text);
                                Navigator.of(context).pop();
                              }
                            )
                          ],
                        ),
                        barrierDismissible: true
                    );
                  },
                  child: Text(
                      "Time"
                  )
              ),
            ],
          )
        ]
    );
  }
}


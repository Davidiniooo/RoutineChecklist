import 'package:flutter/material.dart';
import 'package:flutter_app_test/globals.dart';

List<Widget> tempStepInputForms = [];

class InputForm extends StatefulWidget{
   String routineName;
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  int stepsCounter = 0;

  final _controllerRoutineNameInput = TextEditingController();

  void addStep(){
    setState((){
      stepsCounter++;
      StepInputForm  tempStepInputForm = new StepInputForm(stepsCounter);
      tempStepInputForms.add(tempStepInputForm);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            tempStepInputForms.clear();
            Navigator.of(context).pop();
            },
        ),
        title: Text("Add a new Routine"),
      ),
      body: Column(
        children: <Widget>[
          Form(
            child:Expanded(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topCenter,
                        color: Colors.grey,
                        padding: EdgeInsets.all(10),
                        child: Text("Name of the Routine",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _controllerRoutineNameInput,
                        onChanged: (_){
                          widget.routineName = _controllerRoutineNameInput.text;
                        },
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 3,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tempStepInputForms.length,
                      itemBuilder: (context,i)
                      {
                        return tempStepInputForms[i];
                      },
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
              List<StepInputForm> tempCastedList = tempStepInputForms.cast();
              List<String> tempStepNames = [];
              List<double> tempStepTimes = [];
              for(int i=0;stepsCounter>i;i++)
              {
                tempStepNames.add(tempCastedList[i].stepName);
                tempStepTimes.add(tempCastedList[i].stepTime);
              }
              GLOBAL_LIST_ROUTINES.globalAddRoutine(widget.routineName, tempStepTimes, tempStepNames);
              tempStepInputForms.clear();
              Navigator.of(context).pop();
            },
            child: Text("Submit")
          ),
        ],
      )
    );
  }
}

int globalIndex;
//this is a very bad solution
//TODO: Improve this

class StepInputForm extends StatefulWidget
{
  String stepName;
  double stepTime = -1 ;

  StepInputForm(int i){
    globalIndex = i;
  }
  @override
  _StepInputFormState createState() => _StepInputFormState();
}



class _StepInputFormState extends State<StepInputForm> {
  final _controllerTimeInput = TextEditingController();
  final _controllerStepNameInput = TextEditingController();


  @override
  void dispose(){
    _controllerTimeInput.dispose();
    _controllerStepNameInput.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget> [
          Container(
              color: Colors.grey,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Step $globalIndex :',
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
                  controller: _controllerStepNameInput,
                  onChanged: (_){
                    widget.stepName = _controllerStepNameInput.text;
                  },
                  decoration: InputDecoration(
                    hintText: 'How is this step called?',
                  ),
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
                                widget.stepTime = double.parse(_controllerTimeInput.text);
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


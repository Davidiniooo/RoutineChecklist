import 'package:flutter/material.dart';
import 'package:flutter_app_test/globals.dart';

List<Widget> tempStepInputForms = [];

class InputForm extends StatefulWidget{

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  int stepsCounter = 0;

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
                GLOBAL_LIST_ROUTINES.globalAddRoutine('test', tempStepTimes, tempStepNames);
              }
              Navigator.of(context).pop();
            },
            child: Text("Submit")
          ),
        ],
      )
    );
  }
}

int global_index;
//this is a very bad solution
//TODO: Improve this

class StepInputForm extends StatefulWidget
{
  String stepName;
  double stepTime = -1 ;

  StepInputForm(int i){
    global_index = i;
  }
  @override
  _StepInputFormState createState() => _StepInputFormState();
}



class _StepInputFormState extends State<StepInputForm> {
  final _controllerTimeInput = TextEditingController();
  final _controllerNameInput = TextEditingController();


  @override
  void dispose(){
    _controllerTimeInput.dispose();
    _controllerNameInput.dispose();
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
                'Step $global_index :',
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
                  controller: _controllerNameInput,
                  onChanged: (_){
                    widget.stepName = _controllerNameInput.text;
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


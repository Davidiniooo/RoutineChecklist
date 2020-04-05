import 'package:flutter/material.dart';

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

            RaisedButton(
                color: Colors.green,
                onPressed: Navigator.of(context).pop,
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
  final _controller = TextEditingController();
  @override
  void dispose(){
    _controller.dispose();
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
                            controller: _controller,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Set Time"),
                              onPressed: (){
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(_controller.text),
                                    );
                                  },
                                );
                              },
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


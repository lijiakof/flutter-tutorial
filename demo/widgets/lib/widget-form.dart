import 'package:flutter/material.dart';

class WidgetForms extends StatelessWidget {
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            Checkbox(
              value: false,
              onChanged: (value) { },
            ),
            Radio(
              value: false,
              groupValue: 0,
              onChanged: (value) { },
            ),
            Switch(
              value: false,
              onChanged: (value) {},
            ),
            RaisedButton(
              child: Text('Submit'),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: (){
                if(_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('OK'),
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
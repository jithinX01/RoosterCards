import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RummyJoin extends StatefulWidget {
  RummyJoin({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<int> onChanged;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RummyJoinState createState() => _RummyJoinState();
}

class _RummyJoinState extends State<RummyJoin> {
  final _formKey = GlobalKey<FormState>();
  int code = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 64, left: 32, right: 32),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("JOIN THE TOURNAMENT"),
              //Text("Name of Tournament"),
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4)
                ],
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter  4 digit code';
                  } else if (value!.length != 4) {
                    return '4 digit code';
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                onSaved: (String? value) {
                  if (value != null) {
                    code = int.parse(value);
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Enter Code',
                  border: const OutlineInputBorder(),
                ),
                /*
                onChanged: (String? value) {
                  //ts.tournamentName = value ?? ts.tournamentName;
                  print(value);
                  code = int.parse(value ?? "0");
                },
                */
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print(code);
                      widget.onChanged(code);
                    }
                  },
                  child: const Text('JOIN')),
            ],
          ),
        ),
      ),
    );
  }
}

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
  late int code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          children: <Widget>[
            Text("JOIN THE TOURNAMENT"),
            //Text("Name of Tournament"),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: "Tournament Code"),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                int l = value?.length ?? 0;
                if (l != 4) {
                  return "Wrong Code";
                }
              },
              textAlign: TextAlign.center,
              onSaved: (String? value) {
                //ts.tournamentName = value ?? ts.tournamentName;
                code = int.parse(value ?? "0");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  widget.onChanged(code);
                },
                child: const Text('JOIN')),
          ],
        ),
      ),
    );
  }
}

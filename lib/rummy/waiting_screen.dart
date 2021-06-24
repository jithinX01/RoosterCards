import 'package:flutter/material.dart';

class WaitingScreen extends StatefulWidget {
  WaitingScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  String l = "Cancel";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          l,
        ),
        onPressed: () {
          setState(() {
            l = "Clicked";
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        //padding: const EdgeInsets.only(top: 64),
        //heightFactor: 10,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 64),
                child: Text(
                  "WAITING FOR PLAYERS",
                  textAlign: TextAlign.center,
                )),
            Container(
              padding: const EdgeInsets.only(top: 64),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

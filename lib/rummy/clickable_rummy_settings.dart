import 'package:flutter/material.dart';
import 'package:rooster_cards/rummy/init_tournament_settings.dart';
import 'package:rooster_cards/utilities/num_button.dart';

class ClickableRummySettings extends StatefulWidget {
  ClickableRummySettings({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _ClickableRummySettingsState createState() => _ClickableRummySettingsState();
}

class _ClickableRummySettingsState extends State<ClickableRummySettings> {
  ClickSettings _cs = ClickSettings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context, _cs);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Container(
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          children: <Widget>[
            NumButton(
              onChanged: (val) {
                //rprint("current state $val");
                _cs.noOfDeck = val;
                setState(() {
                  //_shuffle = val;
                });
              },
              name: "Deck",
              value: _cs.noOfDeck,
              minValue: 1,
              maxValue: 5,
            ),
            NumButton(
              onChanged: (val) {
                //rprint("current state $val");
                _cs.noOfPlayers = val;
                setState(() {
                  //_shuffle = val;
                });
              },
              name: "Players",
              value: _cs.noOfPlayers,
              minValue: 2,
              maxValue: 8,
            ),
            if (!_cs.maxPointGame)
              NumButton(
                onChanged: (val) {
                  //rprint("current state $val");
                  _cs.noOfRounds = val;
                  setState(() {
                    //_shuffle = val;
                  });
                },
                name: "Round",
                value: _cs.noOfRounds,
                minValue: 1,
                maxValue: 7,
              ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Max Point Game"),
              Switch(
                  value: _cs.maxPointGame,
                  onChanged: (val) {
                    setState(() {
                      _cs.maxPointGame = val;
                    });
                  }),
            ]),
            if (_cs.maxPointGame)
              NumButton(
                onChanged: (val) {
                  _cs.maxPoints = val;
                  setState(() {});
                },
                value: _cs.maxPoints,
                minValue: 120,
                maxValue: 500,
                name: "Points",
                step: 20,
              ),
          ],
        ),
      ),
    );
  }
}

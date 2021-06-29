import 'package:flutter/material.dart';
import 'package:rooster_cards/rummy/clickable_rummy_settings.dart';
import 'package:rooster_cards/rummy/init_tournament_settings.dart';

class RummyInit extends StatefulWidget {
  RummyInit({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<InitTournamentSettings> onChanged;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RummyInitState createState() => _RummyInitState();
}

class _RummyInitState extends State<RummyInit> {
  InitTournamentSettings ts = InitTournamentSettings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.settings,
        ),
        onPressed: () async {
          ts.cs = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClickableRummySettings(),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Container(
        padding: const EdgeInsets.only(top: 64),
        child: Column(
          children: <Widget>[
            Text("CREAT A TOURNAMENT"),
            //Text("Name of Tournament"),
            TextFormField(
              initialValue: ts.tournamentName,
              textAlign: TextAlign.center,
              onChanged: (String? value) {
                ts.tournamentName = value ?? ts.tournamentName;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  widget.onChanged(ts);
                },
                child: const Text('START')),
          ],
        ),
      ),
    );
  }
}

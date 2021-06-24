import 'package:flutter/material.dart';
import 'package:rooster_cards/navigation_card.dart';
import 'package:rooster_cards/rummy/start_rummy_page.dart';

class RummyHomePage extends StatefulWidget {
  RummyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _RummyHomePageState createState() => _RummyHomePageState();
}

class _RummyHomePageState extends State<RummyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NavigationCard(
              w: StartRummyPage(),
              title: "Start",
              icon: Icons.videogame_asset,
            ),
            NavigationCard(
              w: Container(),
              title: "Join",
              c: Colors.amber,
              icon: Icons.connect_without_contact,
            ),
          ],
        ),
      ),
    );
  }
}

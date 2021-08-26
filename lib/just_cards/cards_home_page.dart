import 'package:flutter/material.dart';
import 'package:rooster_cards/just_cards/card_picker.dart';
import 'package:rooster_cards/just_cards/guess_card_page.dart';

import 'package:rooster_cards/utilities/global_user_data_info.dart';
import 'package:rooster_cards/utilities/navigation_card.dart';

class CardsHomePage extends StatefulWidget {
  CardsHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _CardsHomePageState createState() => _CardsHomePageState();
}

class _CardsHomePageState extends State<CardsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NavigationCard(
                //w: StartRummyPage(),
                w: UserDataInfo(
                    userInfo: UserDataInfo.of(context).userInfo,
                    child: CardPicker()),
                //RummyPageAction(rummyAction: RummyAction.START),
                title: "Just Cards",
                icon: Icons.view_carousel,
              ),
              NavigationCard(
                w: UserDataInfo(
                    userInfo: UserDataInfo.of(context).userInfo,
                    child: GuessCardPage()),
                //w: JoinRummyPage(),
                //w: RummyPageAction(rummyAction: RummyAction.JOIN),
                title: "Guess Card",
                c: Colors.amber,
                icon: Icons.online_prediction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

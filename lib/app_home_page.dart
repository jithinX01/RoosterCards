import 'package:flutter/material.dart';
import 'package:rooster_cards/just_cards/cards_home_page.dart';
import 'package:rooster_cards/trophy/trophy_cabinet.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';
import 'package:rooster_cards/utilities/navigation_card.dart';
import 'package:rooster_cards/rummy/rummy_home_page.dart';

class AppHomePage extends StatefulWidget {
  AppHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          padding: EdgeInsets.all(16.0),
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NavigationCard(
              w: UserDataInfo(
                  userInfo: UserDataInfo.of(context).userInfo,
                  child: RummyHomePage()),
              title: "Rummy",
              icon: Icons.local_play,
            ),
            NavigationCard(
                w: UserDataInfo(
                    userInfo: UserDataInfo.of(context).userInfo,
                    child: TrophyCabinet()),
                title: "Trophy",
                c: Colors.orange,
                icon: Icons.cabin),
            NavigationCard(
                w: UserDataInfo(
                    userInfo: UserDataInfo.of(context).userInfo,
                    child: CardsHomePage()),
                //w: Hand(),
                title: "Cards",
                c: Colors.pink,
                icon: Icons.card_giftcard),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

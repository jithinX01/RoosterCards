import 'package:flutter/material.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';
import 'package:rooster_cards/utilities/navigation_card.dart';
import 'package:rooster_cards/vault/coin_wallet.dart';
import 'package:rooster_cards/vault/trophy_cabinet.dart';

class VaultHomePage extends StatefulWidget {
  VaultHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _VaultHomePageState createState() => _VaultHomePageState();
}

class _VaultHomePageState extends State<VaultHomePage> {
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
                    child: TrophyCabinet()),
                //RummyPageAction(rummyAction: RummyAction.START),
                title: "Trophies",
                icon: Icons.emoji_events,
              ),
              NavigationCard(
                w: UserDataInfo(
                  child: CoinWallet(),
                  userInfo: UserDataInfo.of(context).userInfo,
                ),
                title: "Coins",
                c: Colors.amber,
                icon: Icons.paid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

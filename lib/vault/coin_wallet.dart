import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';
import 'package:rooster_cards/utilities/file_storage.dart';
import 'package:rooster_cards/vault/coin_card.dart';

import 'package:rooster_cards/utilities/global_user_data_info.dart';

class CoinWallet extends StatefulWidget {
  CoinWallet({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _CoinWalletState createState() => _CoinWalletState();
}

class _CoinWalletState extends State<CoinWallet> {
  bool _readCoinCount = false;
  int _cointCount = 0;
  @override
  void initState() {
    _readCoinsCount().then((v) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: CoindCard(
        coins: _readCoinCount
            ? _cointCount
            : UserDataInfo.of(context).userInfo.coins,
        //msg: "Bonus",
      ),
    ));
  }

  Future<void> _readCoinsCount() async {
    var rfs = RoosterFileStorage("user.data");
    await rfs.fileExist;
    UserData userData = UserData.fromBuffer(rfs.readFile());
    _cointCount = userData.coins;
    _readCoinCount = true;
  }
}

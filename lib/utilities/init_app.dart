import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:rooster_cards/app_home_page.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';
import 'package:rooster_cards/utilities/file_storage.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';
import 'package:rooster_cards/utilities/init_login.dart';
import 'package:rooster_cards/utilities/rooster_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rooster_cards/vault/coin_card.dart';

class InitApp extends StatefulWidget {
  final UserData userData;

  InitApp({
    required this.userData,
  });
  @override
  _InitAppState createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  @override
  Widget build(BuildContext context) {
    return _getWidget(context);
  }

  Widget _getWidget(BuildContext context) {
    if (widget.userData.initDone && widget.userData.hasLastLogin()) {
      if (_moreThanDay(DateTime.parse(widget.userData.lastLogin))) {
        return _getBonusWidget();
      } else {
        return UserDataInfo(
            userInfo: widget.userData,
            child: AppHomePage(
              title: "Rooster Cards",
            ));
      }
    } else {
      return InitLogin(onDone: (userData) {
        widget.userData.name = userData.name;
        widget.userData.initDone = true;
        widget.userData.coins = userData.coins;
        widget.userData.lastLogin = userData.lastLogin;
        setState(() {});
      });
    }
  }

  bool _moreThanDay(DateTime dateTime) {
    return dateTime.difference(DateTime.now()).inHours.abs() > 24;
  }

  Widget _getBonusWidget() {
    widget.userData.coins += 100;
    widget.userData.lastLogin = DateTime.now().toString();
    saveUserData(widget.userData);
    return Scaffold(
        body: Container(
      child: Stack(children: [
        CoindCard(
          coins: 100,
          msg: "Daily Bonus",
        ),
        _closeButton(),
      ]),
    ));
  }

  Widget _closeButton() {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton.extended(
                onPressed: () {
                  setState(() {});
                },
                label: Text("OK"))));
  }
}

Future<UserData> loadUserData() async {
  /*
  var rfs = RoosterFileStorage("user.data");
  */

  UserData userData = UserData();

  userData = await readUserData();
  await Future.delayed(Duration(seconds: 2));
  /*
  if (await rfs.fileExist) {
    var data = rfs.readFile();
    userData = UserData.fromBuffer(data);
    //print(userData);
    //return userData;
  }
  */
  var dir = await getApplicationDocumentsDirectory();
  var dirPath = dir.path;
  if (!Directory('$dirPath/trophy').existsSync()) {
    Directory('$dirPath/trophy').createSync();
  }
  userData.trophyDir = '$dirPath/trophy';
  /*
  //just to overrite some nuisance of old releases.
  bool oldRelease = await beforeCurrentRelease();
  if (oldRelease) {
    //userData.initDone = false;
    print("old release ");
    print("coins ${userData.coins}");
  }
  */
/*
  var list = Directory('$dirPath/trophy').listSync();
  //rprint("files $dirPath");

  
  else {
    var list = Directory('$dirPath/trophy').listSync();
    list.forEach((element) {});
  }
  */
  //_initGoogleMobileAds();
  return userData;
}

Widget getInitAppWidget() {
  final Future initFuture = loadUserData();
  return FutureBuilder(future: initFuture, builder: futureBuilder);
}

Widget futureBuilder(BuildContext buildContext, AsyncSnapshot snapshot) {
  if (snapshot.connectionState == ConnectionState.done) {
    return InitApp(userData: snapshot.data);
  } else {
    return RoosterSplash();
  }
}

Future<InitializationStatus> _initGoogleMobileAds() {
  return MobileAds.instance.initialize();
}

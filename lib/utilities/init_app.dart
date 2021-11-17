import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rooster_cards/app_home_page.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';
import 'package:rooster_cards/utilities/file_storage.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';
import 'package:rooster_cards/utilities/init_login.dart';
import 'package:rooster_cards/utilities/rooster_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
      return UserDataInfo(
          userInfo: widget.userData,
          child: AppHomePage(
            title: "Rooster Cards",
          ));
    } else {
      return InitLogin(onDone: (userData) {
        widget.userData.name = userData.name;
        widget.userData.initDone = true;
        setState(() {});
      });
    }
  }
}

Future<UserData> loadUserData() async {
  var rfs = RoosterFileStorage("user.data");
  UserData userData = UserData();
  await Future.delayed(Duration(seconds: 2));
  if (await rfs.fileExist) {
    var data = rfs.readFile();
    userData = UserData.fromBuffer(data);
    //print(userData);
    //return userData;
  }
  var dirPath = await rfs.localPath;
  if (!Directory('$dirPath/trophy').existsSync()) {
    Directory('$dirPath/trophy').createSync();
  }
  userData.trophyDir = '$dirPath/trophy';
/*
  var list = Directory('$dirPath/trophy').listSync();
  //rprint("files $dirPath");

  
  else {
    var list = Directory('$dirPath/trophy').listSync();
    list.forEach((element) {});
  }
  */
  await _initGoogleMobileAds();
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

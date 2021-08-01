import 'package:flutter/material.dart';
import 'package:rooster_cards/app_home_page.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';
import 'package:rooster_cards/utilities/file_storage.dart';
import 'package:rooster_cards/utilities/global_user_data_info.dart';
import 'package:rooster_cards/utilities/init_login.dart';
import 'package:rooster_cards/utilities/rooster_splash.dart';

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
    if (widget.userData.initDone) {
      return UserDataInfo(
          userInfo: widget.userData,
          child: AppHomePage(
            title: "Rooster Rummy",
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
  await Future.delayed(Duration(seconds: 1));
  if (await rfs.fileExist) {
    var data = rfs.readFile();
    userData = UserData.fromBuffer(data);
    return userData;
  }
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

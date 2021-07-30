import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';

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
    return _getWidget();
  }

  Widget _getWidget() {
    return Container();
  }
}

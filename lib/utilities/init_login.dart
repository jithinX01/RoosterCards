import 'package:flutter/material.dart';
import 'package:rooster_cards/proto/user_data.pbserver.dart';

class InitLogin extends StatefulWidget {
  final ValueChanged<UserData> onDone;

  InitLogin({
    required this.onDone,
  });
  @override
  _InitLoginState createState() => _InitLoginState();
}

class _InitLoginState extends State<InitLogin> {
  @override
  Widget build(BuildContext context) {
    return _getWidget();
  }

  Widget _getWidget() {
    return Container();
  }
}

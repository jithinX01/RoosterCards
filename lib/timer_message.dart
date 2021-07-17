import 'dart:async';

import 'package:flutter/material.dart';

class TimerMessage extends StatefulWidget {
  final int time;
  final String message;

  TimerMessage({
    required this.time,
    required this.message,
  });
  @override
  _TimerMessageState createState() => _TimerMessageState();
}

class _TimerMessageState extends State<TimerMessage> {
  bool _visible = true;
  bool _fromTimer = false;
  /*
  @override
  initState() {
    super.initState();
  }
  */
  @override
  Widget build(BuildContext context) {
    if (!_fromTimer) {
      _visible = true;
      Timer(Duration(seconds: widget.time), () {
        setState(() {
          _visible = false;
          _fromTimer = true;
        });
      });
    } else {
      _fromTimer = false;
    }

    return Visibility(
        visible: _visible,
        child: FloatingActionButton.extended(
          onPressed: () {},
          //isExtended: true,
          //icon: Icon(Icons.confirmation_number),
          label: Text(widget.message),
          heroTag: "btnc_timer_message",
          //shape: CircleBorder() ,
        ));
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  final Function onEnd;
  final int time;

  TimerButton({
    required this.onEnd,
    required this.time,
  });
  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  late int _timeLeft = widget.time;

  @override
  initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      print(_timeLeft);
      if (_timeLeft <= 0) {
        timer.cancel();
        widget.onEnd();
      } else {
        --_timeLeft;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      //isExtended: true,
      //icon: Icon(Icons.confirmation_number),
      label: Text(_timeLeft.toString()),
      heroTag: "btnc_timer",
      //shape: CircleBorder() ,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rooster_cards/just_cards/deck.dart';

class CardPicker extends StatefulWidget {
  CardPicker();
  @override
  _CardPickerState createState() => _CardPickerState();
}

class _CardPickerState extends State<CardPicker> {
  String _s = "Sorted";
  Icon _i = Icon(Icons.sort);
  bool _shuffled = false;
  int _count = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24.0),
            ),
            SizedBox(
              child: Deck(
                count: _count,
                shuffle: _shuffled,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cardOrder(),
                  cardCount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardOrder() {
    return FloatingActionButton.extended(
      onPressed: () {
        _shuffled = !_shuffled;
        if (_shuffled) {
          _s = "Shuffled";
          _i = Icon(Icons.shuffle);
        } else {
          _s = "Sorted";
          _i = Icon(Icons.sort);
        }
        setState(() {});
      },
      label: Text(_s),
      icon: _i,
    );
  }

  Widget cardCount() {
    return Container(
      child: NumberPicker(
          minValue: 5,
          maxValue: 53,
          itemCount: 1,
          value: _count,
          onChanged: (val) {
            setState(() {
              _count = val;
            });
          }),
    );
  }
}

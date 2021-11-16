import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumButton extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final value;
  final minValue;
  final maxValue;
  final String name;
  final int step;
  final Icon icon;
  NumButton(
      {required this.onChanged,
      required this.name,
      this.value,
      this.minValue,
      this.maxValue,
      this.step = 1,
      this.icon = const Icon(Icons.confirmation_number)});
  @override
  _NumButtonState createState() => _NumButtonState();
}

class _NumButtonState extends State<NumButton> {
  int _count = 52;
  String _s = "Count";
  @override
  void initState() {
    super.initState();
    _count = widget.value;
    _s = /* _count.toString() + " " + */ widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.max,
          children: [
            NumberPicker(
              minValue: widget.minValue,
              maxValue: widget.maxValue,
              value: _count,
              itemCount: 1,
              //axis: Axis.horizontal,
              onChanged: (value) => setState(() {
                _count = value;
                _s = /*_count.toString() + " " + */ widget.name;
                widget.onChanged(_count);
              }),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
              ),
              step: widget.step,
              //itemHeight: 25,
            ),
            FloatingActionButton.extended(
              onPressed: () {},
              //isExtended: true,
              icon: Icon(Icons.confirmation_number),
              label: Text(_s),
              heroTag: "btnc" + widget.name,
              //shape: CircleBorder() ,
            ),
          ],
        ));
  }
}

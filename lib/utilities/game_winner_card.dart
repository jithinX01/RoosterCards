import 'package:flutter/material.dart';

class GameWinnerCard extends StatelessWidget {
  final String title;

  final Color c;
  final IconData icon;
  const GameWinnerCard({
    Key? key,
    this.title = "",
    this.c = Colors.green,
    this.icon = Icons.military_tech,
  }) : super(key: key);

  Decoration getDecoration({Color c = Colors.grey}) {
    return BoxDecoration(
      color: c,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(7.0),
      boxShadow: [
        BoxShadow(
          color: Colors.blue,
          blurRadius: 20.0,
        ),
      ],
    );
  }

  Widget getCard(String val, Color c, IconData icon) {
    return Container(
      width: 300,
      height: 250,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: getDecoration(c: c),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 96,
          ),
          Text(
            val,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "WINNER",
            style: TextStyle(
              fontSize: 32,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        //top: 20,
        child: Align(
      alignment: Alignment.center,
      child: getCard(this.title, this.c, this.icon),
    ));
  }
}

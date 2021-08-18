import 'package:flutter/material.dart';

class TrophyCard extends StatelessWidget {
  final String tournamentName;
  final bool sharedTrophy;
  final List<String> wonPlayers;
  final int trophyId;

  final Color c;
  final IconData icon;
  const TrophyCard({
    Key? key,
    this.tournamentName = "",
    this.c = Colors.green,
    this.icon = Icons.emoji_events,
    this.sharedTrophy = false,
    this.trophyId = 0,
    required this.wonPlayers,
  }) : super(key: key);

  Decoration _getDecoration({Color c = Colors.grey}) {
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
      /*
      gradient: LinearGradient(
        // Where the linear gradient begins and ends
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // Add one stop for each color. Stops should increase from 0 to 1
        stops: [0.05, 0.2, 0.5, 0.95],
        colors: [
          // Colors are easy thanks to Flutter's Colors class.
          Colors.orange.shade100,
          Colors.orange.shade100,
          Colors.orange.shade50,
          Colors.orange.shade100,
        ],
      ),
      */
    );
  }

  Widget _getCard(String tournamentName, Color c, IconData icon) {
    return Container(
      width: 300,
      height: 400,
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: _getDecoration(c: c),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getWidgets(),
      ),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> wl = [
      /*
      Icon(
        icon,
        size: 96,
      ),
      */
      Image.asset(
        'images/trophy.png',
        scale: 1,
      ),
      Text(
        tournamentName,
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        this.sharedTrophy ? "WINNERS" : "WINNER",
        style: TextStyle(
          fontSize: 32,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      )
    ];
    this.wonPlayers.forEach((player) {
      wl.add(Text(
        player,
        style: TextStyle(
          fontSize: 32,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
        ),
      ));
    });
    return wl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //top: 20,
        child: Align(
      alignment: Alignment.center,
      child: _getCard(this.tournamentName, this.c, this.icon),
    ));
  }
}

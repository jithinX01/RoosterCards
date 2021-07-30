import 'package:flutter/material.dart';

class TournamentWinnersCard extends StatelessWidget {
  final String tournamentName;
  final bool sharedTrophy;
  final List<String> wonPlayers;

  final Color c;
  final IconData icon;
  const TournamentWinnersCard({
    Key? key,
    this.tournamentName = "",
    this.c = Colors.green,
    this.icon = Icons.emoji_events,
    this.sharedTrophy = false,
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
    );
  }

  Widget _getCard(String tournamentName, Color c, IconData icon) {
    return Container(
      width: 300,
      height: 600,
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
      Icon(
        icon,
        size: 96,
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
    return Positioned.fill(
        //top: 20,
        child: Align(
      alignment: Alignment.center,
      child: _getCard(this.tournamentName, this.c, this.icon),
    ));
  }
}

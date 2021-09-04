import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rooster_cards/cards/boxofcards.dart';
import 'package:rooster_cards/cards/playing_card.dart';

class RoosterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          //child: Text("Roost Cards"),
          child: PlayingCard(PCardInfo("ROOSTER", Suit.ROOSTER)),
        ),
      ),
    );
  }
}

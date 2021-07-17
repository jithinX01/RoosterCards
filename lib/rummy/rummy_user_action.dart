enum RUserAction {
  NORMAL_SWAP,
  REPLACE,
  DISCARD,
}

class RummyUserAction {
  final RUserAction rUserAction;
  List<int> playerCards = List.empty(growable: true);
  late int oldCard;
  late int newCard;
  List<int> get cards => playerCards;
  RummyUserAction({required this.rUserAction});
}

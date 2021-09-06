class InitTournamentSettings {
  ClickSettings cs = ClickSettings();
  String tournamentName = "Home League";
  int trophyId = 0;
  void logInfo() {
    /*
   print(
        "Tournament info ${cs.noOfDeck}, ${cs.noOfPlayers}, " + tournamentName);
   */
  }
}

class ClickSettings {
  int noOfDeck = 1;
  int noOfPlayers = 2;
  int noOfRounds = 1;
}

const int JOKER = 52;

class PossibleMelds {
  var melds = {};
  int count = 0;
  int points = 130;
  var deadwood = [];
  void checkFourSet() {
    //sort by points
    deadwood.sort((a, b) {
      int am = (a % 13) + 1;
      am = am > 10 ? 10 : am;
      int bm = (b % 13) + 1;
      bm = bm > 10 ? 10 : bm;
      return bm - am;
    });
    print(deadwood);
    //check for the 4th set
    for (var l in deadwood) {
      bool found = false;
      melds.forEach((key, val) {
        if (key == 'run') {
          for (var m in val) {
            //print(m);
            int limit = ((m[2] ~/ 13) + 1) * 13;
            /*
          for (var l in deadwood) {
            */
            if ((m[2] + 1 < limit && m[2] + 1 == l) || (l + 1 == m[0])) {
              m.add(l);
              m.sort();
              deadwood.remove(l);
              int point = (l % 13) + 1;
              point = point > 10 ? 10 : point;
              points -= point;
              found = true;
              return;
            }
            /*  
          }
          */
          }
        }
        if (key == 'set') {
          for (var m in val) {
            //print(m);
            /*
          for (var l in deadwood) {
          */
            if ((m[2] + 13 < 52 && m[2] + 13 == l) || (l + 13 == m[0])) {
              m.add(l);
              m.sort();
              deadwood.remove(l);
              int point = (l % 13) + 1;
              point = point > 10 ? 10 : point;
              points -= point;
              found = true;
              return;
            }
            /*
          }
          */
          }
        }
      });
      if (found) {
        break;
      }
    }
  }
}

bool isWinningHand(List<int>? cards) {
  print("isWinningHand");
  List<int> L = List.from(cards ?? []);
  if (L.length != 13) {
    return false;
  }
  L.sort();
  print(cards);
  var jokers = findJokers(L);
  var meld = {};
  List<int> winningMeld = [];
  PossibleMelds possibleMelds = PossibleMelds();
  //return winningHand(L, jokers, meld, winningMeld, noOfJokers: jokers.length);
  bool valid = winningHand(L, jokers, meld, winningMeld, possibleMelds,
      noOfJokers: jokers.length, findPossibleMeld: true);
  if (valid) {
    cards?.clear();
    cards?.addAll(winningMeld);
  } else {
    possibleMelds.checkFourSet();
  }
  print(" winning Set $cards");
  print(
      "FindPossibleMelds c ${possibleMelds.count} m ${possibleMelds.melds} d ${possibleMelds.deadwood} p ${possibleMelds.points}");

  return valid;
}

void FindPossibleMelds(
    var meld, var deadWood, PossibleMelds meldInfo, int setCount) {
  int points = getPoints(deadWood);
  if (setCount > meldInfo.count || points < meldInfo.points) {
    //print("gt setCount $setCount");
    meldInfo.count = setCount;
    //meldInfo.melds = Map.from(meld);
    meldInfo.melds = {};
    meld.forEach((key, val) {
      //print(val);
      meldInfo.melds[key] = [];
      val.forEach((e) {
        meldInfo.melds[key].add(e);
      });
    });
    meldInfo.deadwood = List.from(deadWood);
    meldInfo.points = points;
  }
}

int getPoints(var deadwood) {
  int points = 0;
  deadwood.forEach((val) {
    int point = (val % 13) + 1;
    point = point > 10 ? 10 : point;
    if (val == 52) {
      point = 0;
    }
    points += point;
  });
  return points;
}

List<int> findRun(List<int> L, int lStart, List<int> jokers,
    {int noOfDeck = 1}) {
  List<int> run = [];
  List<int> used_jokers = [];
  if (lStart < L.length) {
    int mstart = L[lStart];
    int limit = ((mstart ~/ 13) + 1) * 13;
    while (mstart < limit && lStart < L.length) {
      if (mstart == L[lStart]) {
        run.add(L[lStart]);
        if (run.length == 3) {
          return run;
        }
        lStart += 1;
        if (lStart < L.length && mstart == L[lStart]) {
          break;
        }
        /*
		       else {
		       mstart += 1;
		       }
		     */
      } else if (run.length > 0 && jokers.length > 0) {
        run.add(jokers.elementAt(0));
        used_jokers.add(jokers.elementAt(0));
        jokers.removeAt(0);
      } else {
        break;
      }
      mstart += 1;
    }
  }
  //if dont find run
  //remove jokers and add back to jokers set
  if (used_jokers.length > 0) {
    jokers.add(used_jokers.elementAt(0));
    run.removeLast();
  }
  /*
  else
  {

  }
  */
  if (jokers.length + run.length >= 3) {
    while (run.length < 3 && jokers.isNotEmpty) {
      run.add(jokers.elementAt(0));
      jokers.removeAt(0);
    }
  }
  return run;
}

bool fourthMeldFound(var meld, List<int> L, List<int> jokers) {
  //print("fourth $meld $L $jokers");
  if (jokers.length == 1) {
    return true;
  } else if (L.length == 1) {
    if (meld.containsKey("run")) {
      for (var m in meld["run"]) {
        //print(m);
        int limit = ((m[2] ~/ 13) + 1) * 13;
        if (m[2] + 1 < limit && m[2] + 1 == L[0]) {
          m.add(L[0]);
          return true;
        }
      }
    }
    if (meld.containsKey("set")) {
      for (var m in meld["set"]) {
        //print(m);
        if (m[2] + 13 < 52 && m[2] + 13 == L[0]) {
          m.add(L[0]);
          return true;
        }
      }
    }
  }
  return false;
}

bool winningHand(List<int> L, List<int> jokers, var meld, var winningMeld,
    PossibleMelds meldInfo,
    {int noOfJokers = 0,
    int noOfDeck = 1,
    int lStart = 0,
    //bool fourFound = false,
    bool pureRunFound = false,
    int setCount = 0,
    bool findPossibleMeld = false}) {
  List<int> L1 = List.from(L);
  List<int> jokers1 = List.from(jokers);
  //bool fourFound1 = fourFound;
  bool pureRunFound1 = pureRunFound;

  while ((L.length - lStart) + jokers.length >= 3) {
    //print("______winningHand----, L $L, j $jokers, $meld");
    List<int> run = findRun(L, lStart, jokers);
    //if find a run with len 3
    if (run.length == 3) {
      setCount += 1;
      int jkCount = noOfJokers - jokers.length;
      noOfJokers = jokers.length;
      if (lStart < L.length) {
        L = L.sublist(0, lStart) + L.sublist(lStart + (3 - jkCount));
      }

      //print("3------set, $run, $L, $lStart");
      if (!meld.containsKey("run")) {
        meld["run"] = [];
      }

      meld["run"].add(run);
      //print("meld $meld $L");
      if (findPossibleMeld) {
        FindPossibleMelds(meld, L, meldInfo, setCount);
      }

      bool valid = false;
      if (setCount == 4) {
        //print("$meld");
        valid = fourthMeldFound(meld, L, jokers);
        if (valid) {
          //print(meld);
          //winningMeld.add(meld);
          winningCards(meld, winningMeld);
          return valid;
        }
      }

      valid = winningHand(
        List.from(L),
        List.from(jokers),
        Map.from(meld),
        winningMeld,
        meldInfo,
        noOfJokers: jokers.length,
        noOfDeck: noOfDeck,
        lStart: lStart,
        setCount: setCount,
        //fourFound: fourFound,
        pureRunFound: pureRunFound,
        findPossibleMeld: findPossibleMeld,
      );
      if (valid) {
        //print(run);
        return valid;
      }

      setCount -= 1;
      meld["run"].removeLast();
      lStart += 1;
      //reset
      L.clear();
      L.addAll(L1);
      jokers.clear();
      jokers.addAll(jokers1);
      noOfJokers = jokers.length;
      //fourFound = fourFound1;
      pureRunFound = pureRunFound1;
    } else {
      if (run.length > 0) {
        lStart += run.length;
        continue;
      }
    }
  }

  bool valid = false;
  if (setCount > 0) {
    valid = winningSet(List.from(L), List.from(jokers), setCount, pureRunFound,
        Map.from(meld), winningMeld, meldInfo,
        findPossibleMeld: findPossibleMeld);
    if (valid) {
      //print(run);
      return valid;
    }
  }

  return false;
}

bool winningSet(List<int> L, List<int> jokers, int setCount, bool pureRunFound,
    var meld, var winningMeld, PossibleMelds meldInfo,
    {int noofDeck = 1, bool findPossibleMeld = false}) {
  //var setList = [];
  List<int> remainList = [];
  while (L.length + jokers.length >= 3) {
    List<int> set = findSet(L, jokers);
    if (set.length == 3) {
      setCount += 1;
      //print("3v------set, $set, $L");

      if (!meld.containsKey("set")) {
        meld["set"] = [];
      }
      meld["set"].add(set);
      //print("meld $meld $L");
      if (findPossibleMeld) {
        FindPossibleMelds(meld, L, meldInfo, setCount);
      }
      bool valid = false;
      if (setCount == 4) {
        L.addAll(remainList);
        valid = fourthMeldFound(meld, L, jokers);
        if (valid) {
          //print("$meld");
          //winningMeld.add(meld);
          winningCards(meld, winningMeld);
          return valid;
        }
      }
    } else if (set.length > 0) {
      for (var item in set) {
        remainList.add(item);
      }
    }
  }
  return false;
}

List<int> findSet(List<int> L, List<int> jokers, {int noOfDeck = 1}) {
  List<int> set = [];
  if (L.length > 0) {
    int index = L[0];
    while (index < 52 && L.length > 0) {
      if (L.contains(index)) {
        set.add(index);
        L.remove(index);
        if (set.length == 3) {
          return set;
        }
        if (L.contains(index)) break;
      }
      index += 13;
    }
  }

  if (jokers.length + set.length >= 3) {
    while (set.length < 3 && jokers.isNotEmpty) {
      set.add(jokers.elementAt(0));
      jokers.removeAt(0);
    }
  }
  return set;
}

List<int> findJokers(List<int> list, {int wildCard = 53}) {
  var cardLen = list.length;
  List<int> jokers = [];
  while (cardLen - 1 > 0) {
    int card = list[cardLen - 1];
    if (card == JOKER || card == wildCard) {
      jokers.add(card);
      list.remove(card);
    }
    cardLen -= 1;
  }
  return jokers;
}

void winningCards(var meld1, var winningMeld) {
  Map meld = Map.from(meld1);
  meld.forEach((key, listOfMeld) {
    listOfMeld.forEach((meld) {
      meld.forEach((card) {
        winningMeld.add(card);
      });
    });
  });
}

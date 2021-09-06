const int JOKER = 52;

class PossibleMelds {
  var mMelds = {};
  int mCount = 0;
  int mPts = 130;
  var mDeadwood = [];
  List<int> mUnmodJokers = [];
  List<int> mJokers = [];
  void checkFourSet() {
    //sort by points
    mDeadwood.sort((a, b) {
      int am = (a % 13) + 1;
      am = am > 10 ? 10 : am;
      int bm = (b % 13) + 1;
      bm = bm > 10 ? 10 : bm;
      return bm - am;
    });
    //print(deadwood);
    //check for the 4th set
    for (var l in mDeadwood) {
      for (var e in mMelds.entries) {
        for (var m in e.value) {
          if (checkFourthMelds(m, e.key, l, mUnmodJokers)) {
            m.add(l);
            m.sort();
            mDeadwood.remove(l);
            int point = (l % 13) + 1;
            point = point > 10 ? 10 : point;
            mPts -= point;
            return;
          }
        }
      }

      if (mJokers.length > 0) {
        for (var item in mMelds.entries) {
          for (List m in item.value) {
            m.add(mJokers[0]);
            mJokers.removeAt(0);
            return;
          }
        }
      }

      /*
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
              pts -= point;
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
              pts -= point;
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
      */
    }
  }

  List<int> get sets {
    List<int> sets = [];
    Map meld = Map.from(mMelds);
    meld.forEach((key, listOfMeld) {
      listOfMeld.forEach((meld) {
        meld.forEach((card) {
          sets.add(card);
        });
      });
    });
    mDeadwood.forEach((element) {
      sets.add(element);
    });
    mJokers.forEach((element) {
      sets.add(element);
    });
    return sets;
  }

  int get points {
    if (mCount > 0) {
      return mPts;
    }

    mPts = 0;
    mDeadwood.forEach((val) {
      int p = (val % 13) + 1;
      p = p > 10 ? 10 : p;
      if (val == 52 || mUnmodJokers.contains(val)) {
        p = 0;
      }
      mPts += p;
    });
    return mPts;
  }
}

bool isWinningHand(List<int>? cards) {
  //rprint("isWinningHand");
  List<int> L = List.from(cards ?? []);
  if (L.length != 13) {
    return false;
  }
  L.sort();
  //rprint(cards);
  var jokers = findJokers(L);
  List<int> unmodJokers = List.unmodifiable(jokers);
  var meld = {};
  List<int> winningMeld = [];
  PossibleMelds possibleMelds = PossibleMelds();
  //return winningHand(L, jokers, meld, winningMeld, noOfJokers: jokers.length);
  bool valid = winningHand(
      L, jokers, meld, winningMeld, possibleMelds, unmodJokers,
      noOfJokers: jokers.length, findPossibleMeld: false);
  if (valid) {
    cards?.clear();
    cards?.addAll(winningMeld);
  }
  /* 
  else {
    possibleMelds.checkFourSet();
  }
  */
  //rprint(" winning Set $cards");
  /*
 //rprint(
      "FindPossibleMelds c ${possibleMelds.count} m ${possibleMelds.melds} d ${possibleMelds.deadwood} p ${possibleMelds.points}");
      */

  return valid;
}

int findPoints(List<int>? cards) {
  //rprint("findPoints");
  List<int> L = List.from(cards ?? []);
  if (L.length != 13) {
    return 130;
  }
  L.sort();
  //rprint(cards);
  var jokers = findJokers(L);
  List<int> unmodJokers = List.unmodifiable(jokers);
  var meld = {};
  List<int> winningMeld = [];
  PossibleMelds possibleMelds = PossibleMelds();
  possibleMelds.mUnmodJokers.addAll(unmodJokers);
  //return winningHand(L, jokers, meld, winningMeld, noOfJokers: jokers.length);
  bool valid = winningHand(
      L, jokers, meld, winningMeld, possibleMelds, unmodJokers,
      noOfJokers: jokers.length, findPossibleMeld: true);
  if (valid) {
    cards?.clear();
    cards?.addAll(winningMeld);
  } else {
    if (possibleMelds.mCount > 0) {
      possibleMelds.checkFourSet();
    } else {
      possibleMelds.mDeadwood = L;
    }
    cards?.clear();
    cards?.addAll(possibleMelds.sets);
  }
/*
 print(
      "FindPossibleMelds c ${possibleMelds.mCount} m ${possibleMelds.mMelds} d ${possibleMelds.mDeadwood} p ${possibleMelds.mPts}");
      */
  //rprint("cards ${possibleMelds.sets}");
  return possibleMelds.points;
}

void findPossibleMelds(var meld, var deadWood, PossibleMelds meldInfo,
    int setCount, List<int> jokers) {
  int points = getPoints(deadWood);
  if (setCount > meldInfo.mCount || points < meldInfo.mPts) {
    //print("gt setCount $setCount");
    meldInfo.mCount = setCount;
    //meldInfo.melds = Map.from(meld);
    meldInfo.mMelds = {};
    meld.forEach((key, val) {
      //print(val);
      meldInfo.mMelds[key] = [];
      val.forEach((e) {
        meldInfo.mMelds[key].add(e);
      });
    });
    meldInfo.mDeadwood = List.from(deadWood);
    meldInfo.mJokers = List.from(jokers);
    meldInfo.mPts = points;
  }
}

int getPoints(var deadwood) {
  int points = 0;
  deadwood.forEach((val) {
    int point = (val % 13) + 1;
    point = point > 10 ? 10 : point;
    /*
    if (val == JOKER || unmodJokers.contains(val)) {
      point = 0;
    }
    */
    points += point;
  });
  return points;
}

List<int> findRun(List<int> L, int lStart, List<int> jokers,
    {int noOfDeck = 1, int setLen = 3}) {
  List<int> run = [];
  List<int> usedJokers = [];
  if (lStart < L.length) {
    int mstart = L[lStart];
    int limit = ((mstart ~/ 13) + 1) * 13;
    while (mstart < limit && lStart < L.length) {
      if (mstart == L[lStart]) {
        run.add(L[lStart]);
        if (run.length == setLen) {
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
        usedJokers.add(jokers.elementAt(0));
        jokers.removeAt(0);
        if (run.length == setLen) {
          return run;
        }
      } else {
        break;
      }
      mstart += 1;
    }
  }
  //if dont find run
  //remove jokers and add back to jokers set
  if (usedJokers.length > 0) {
    jokers.add(usedJokers.elementAt(0));
    run.removeLast();
  }
  /*
  else
  {

  }
  */
  if (jokers.length + run.length >= setLen) {
    while (run.length < setLen && jokers.isNotEmpty) {
      run.add(jokers.elementAt(0));
      jokers.removeAt(0);
    }
  }
  return run;
}

bool fourthMeldFound(
    Map meld, List<int> L, List<int> jokers, List<int> unmodJokers) {
  //rprint("fourth $meld $L $jokers");
  if (jokers.length == 1) {
    for (var item in meld.entries) {
      for (List m in item.value) {
        m.add(jokers[0]);
        return true;
      }
    }
  } else if (L.length == 1) {
    for (var e in meld.entries) {
      for (var m in e.value) {
        if (checkFourthMelds(m, e.key, L[0], unmodJokers)) {
          m.add(L[0]);
          return true;
        }
      }
    }
  }
  return false;
}

bool checkFourthMelds(
    List<int> m, String type, int lastCard, List<int> unmodJokers) {
  List<int> tL = [];
  List<int> tJokers = [];
  m.forEach((element) {
    if (unmodJokers.contains(element)) {
      tJokers.add(element);
    } else {
      tL.add(element);
    }
  });
  tL.add(lastCard);
  tL.sort();
  if (type == "run") {
    return findRun(tL, 0, tJokers, setLen: 4).length == 4;
  } else if (type == "set") {
    return findSet(tL, tJokers, setLen: 4).length == 4;
  }
  return false;
}

bool winningHand(List<int> L, List<int> jokers, var meld, var winningMeld,
    PossibleMelds meldInfo, List<int> unmodJokers,
    {int noOfJokers = 0,
    int noOfDeck = 1,
    int lStart = 0,
    //bool fourFound = false,
    bool pureRunFound = false,
    int setCount = 0,
    bool findPossibleMeld = false}) {
  List<int> l1 = List.from(L);
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
        findPossibleMelds(meld, L, meldInfo, setCount, jokers);
      }

      bool valid = false;
      if (setCount == 4) {
        //print("$meld");
        valid = fourthMeldFound(meld, L, jokers, unmodJokers);
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
        unmodJokers,
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
      L.addAll(l1);
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
        Map.from(meld), winningMeld, meldInfo, unmodJokers,
        findPossibleMeld: findPossibleMeld);
    if (valid) {
      //print(run);
      return valid;
    }
  }

  return false;
}

bool winningSet(List<int> L, List<int> jokers, int setCount, bool pureRunFound,
    var meld, var winningMeld, PossibleMelds meldInfo, List<int> unmodJokers,
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
        findPossibleMelds(meld, remainList + L, meldInfo, setCount, jokers);
      }
      bool valid = false;
      if (setCount == 4) {
        L.addAll(remainList);
        valid = fourthMeldFound(meld, L, jokers, unmodJokers);
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

List<int> findSet(List<int> L, List<int> jokers,
    {int noOfDeck = 1, int setLen = 3}) {
  List<int> set = [];
  if (L.length > 0) {
    int index = L[0];
    while (index < 52 && L.length > 0) {
      if (L.contains(index)) {
        set.add(index);
        L.remove(index);
        if (set.length == setLen) {
          return set;
        }
        if (L.contains(index)) break;
      }
      index += 13;
    }
  }

  if (jokers.length + set.length >= setLen) {
    while (set.length < setLen && jokers.isNotEmpty) {
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

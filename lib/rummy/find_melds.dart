import 'package:rooster_cards/rummy/possible_winning_hand_lib.dart';
import 'package:rooster_cards/rummy/rummy_user_action.dart';

void findMelds(List<int> L, var meld) {
  L.sort();
  List<int> jokers = findJokers(L);
  int noOfJokers = jokers.length;
  bool fourSetFound = false;
  for (var setLen = 4; setLen > 1; setLen--) {
    int lStart = 0;

    while ((L.length - lStart) + jokers.length >= setLen) {
      List<int> run = findRun(L, lStart, jokers, setLen: setLen);
      if (run.length == setLen) {
        int jkCount = noOfJokers - jokers.length;
        noOfJokers = jokers.length;
        if (lStart < L.length) {
          L = L.sublist(0, lStart) + L.sublist(lStart + (setLen - jkCount));
        }
        if (!meld.containsKey(setLen)) {
          meld[setLen] = {};
          meld[setLen]["run"] = [];
        }
        meld[setLen]["run"].add(run);
        //only one 4 set needed.
        if (4 == setLen) {
          fourSetFound = true;
          break;
        }
      } else if (run.length > 0) {
        lStart += run.length;
      } else {
        lStart += 1;
      }
    }
    //no need to find sets
    if (setLen == 4 && fourSetFound) {
      continue;
    }

    List<int> remainList = [];
    while (L.length + jokers.length >= setLen) {
      List<int> set = findSet(L, jokers, setLen: setLen);
      if (set.length == setLen) {
        if (!meld.containsKey(setLen)) {
          meld[setLen] = {};
          meld[setLen]["set"] = [];
        }
        if (!meld[setLen].containsKey("set")) {
          meld[setLen]["set"] = [];
        }
        meld[setLen]["set"].add(set);
      } else if (set.length > 0) {
        for (var item in set) {
          remainList.add(item);
        }
      }
    }
    L.addAll(remainList);
    L.sort();
  }
  if (L.isNotEmpty) {
    meld[1] = L;
  }
}

RummyUserAction getUserAction(Map meldInfo, int card) {
  bool skip3And4Melds = meldInfo.containsKey(4);

  for (var e in meldInfo.entries) {
    var setLen = e.key;
    var melds = e.value;

    if (skip3And4Melds && (setLen == 4 || setLen == 3)) {
      continue;
    }
    if (setLen > 1) {
      for (var item in melds.entries) {
        var key = item.key;
        var val = item.value;

        if (key == 'run') {
          for (var m in val) {
            //print(m);
            int limit = ((m[setLen - 1] ~/ 13) + 1) * 13;
            /*
          for (var l in deadwood) {
            */
            if ((card == JOKER) ||
                (m[setLen - 1] + 1 < limit && m[setLen - 1] + 1 == card) ||
                (card + 1 == m[0])) {
              m.add(card);
              m.sort();

              saveVal(meldInfo, setLen, key, m);
              val.remove(m);
              var r = replaceCard(meldInfo);
              var action = RummyUserAction(rUserAction: RUserAction.REPLACE);
              action.newCard = card;
              action.oldCard = r;
              return action;
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
            if ((card == JOKER) ||
                (m[setLen - 1] + 13 < 52 && m[setLen - 1] + 13 == card) ||
                (card + 13 == m[0])) {
              m.add(card);
              m.sort();
              saveVal(meldInfo, setLen, key, m);
              val.remove(m);

              var r = replaceCard(meldInfo);
              var action = RummyUserAction(rUserAction: RUserAction.REPLACE);
              action.newCard = card;
              action.oldCard = r;
              return action;
            }
            /*
          }
          */
          }
        }
      }
    } else if (setLen == 1) {
      for (var item in melds) {
        int limit = ((item ~/ 13) + 1) * 13;
        /*
          for (var l in deadwood) {
            */
        if ((card == JOKER) ||
            (item + 1 < limit && item + 1 == card) ||
            (card + 1 == item)) {
          var m = [item, card];
          saveVal(meldInfo, setLen, "run", m);
          melds.remove(item);

          var r = replaceCard(meldInfo);
          var action = RummyUserAction(rUserAction: RUserAction.REPLACE);
          action.newCard = card;
          action.oldCard = r;
          return action;
        } else if ((card == JOKER) ||
            (item + 13 < 52 && item + 13 == card) ||
            (card + 13 == item)) {
          var m = [item, card];
          saveVal(meldInfo, setLen, "set", m);
          melds.remove(item);

          var r = replaceCard(meldInfo);
          var action = RummyUserAction(rUserAction: RUserAction.REPLACE);
          action.newCard = card;
          action.oldCard = r;
          return action;
        }
      }
    }
  }

  var action = RummyUserAction(rUserAction: RUserAction.DISCARD);
  action.newCard = card;
  return action;
}

void saveVal(var meldInfo, var setLen, var key, var m) {
  if (!meldInfo.containsKey(setLen + 1)) {
    meldInfo[setLen + 1] = {};
    meldInfo[setLen + 1][key] = [];
  }
  if (!meldInfo[setLen + 1].containsKey(key)) {
    meldInfo[setLen + 1][key] = [];
  }
  meldInfo[setLen + 1][key].add(m);
}

int replaceCard(Map meldInfo) {
  for (var i = 1; i < 3; i++) {
    if (i == 1) {
      if (meldInfo.containsKey(i) && meldInfo[i].length > 0) {
        var k = meldInfo[i].removeAt(0);
        return k;
      }
    } else if (i == 2) {
      if (meldInfo.containsKey(i)) {
        for (var item in meldInfo[i].entries) {
          //var key = item.key;
          var val = item.value;
          for (var m in val) {
            var k = m.removeAt(0);
            var r = m.removeAt(0);
            if (meldInfo.containsKey(1)) {
              meldInfo[1].add(r);
            }
            return k;
          }
        }
      }
    }
  }
  return -1;
}

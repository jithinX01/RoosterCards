class GinMeldInfo {
  var mMelds = {};
  int mCount = 0;
  int mPts = 130;
  var mDeadwood = [];

  

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

    return sets;
  }

  int get points {
    /*
    if (mCount > 0) {
      return mPts;
    }
    */

    mPts = 0;
    mDeadwood.forEach((val) {
      int p = (val % 13) + 1;
      p = p > 10 ? 10 : p;
      mPts += p;
    });
    return mPts;
  }
}

void findPossibleGinMelds(var meld, var deadWood, GinMeldInfo meldInfo) {
  int points = getGinPoints(deadWood);
  if (points < meldInfo.mPts) {
    meldInfo.mMelds = {};
    meld.forEach((key, val) {
      //print(val);
      meldInfo.mMelds[key] = [];
      val.forEach((e) {
        meldInfo.mMelds[key].add(e);
      });
    });
    meldInfo.mDeadwood = List.from(deadWood);
    meldInfo.mPts = points;
  }
}

int getGinPoints(var deadwood) {
  int points = 0;
  deadwood.forEach((val) {
    int point = (val % 13) + 1;
    point = point > 10 ? 10 : point;
    points += point;
  });
  return points;
}

List<int> findGinRun(List<int> L, int lStart, {int setLen = 3}) {
  List<int> run = [];
  //print(L);
  //print(lStart);
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
      } else {
        break;
      }
      mstart += 1;
    }
  }
  return run;
}

int ginWinHand(List<int> L, GinMeldInfo meldInfo, var meld,
    {int lStart = 0, int setLen = 3}) {
  //print("GinWinHand- $L");
  //List<int> l1 = List.from(L);

  int setLen1 = setLen;
  int lStart1 = lStart;
  while (lStart < L.length) {
    
    while (L.length - lStart >= setLen) {
      List<int> run = findGinRun(L, lStart, setLen: setLen);
      if (run.length == setLen) {
        if (!meld.containsKey("run")) {
          meld["run"] = [];
        }
        //print("run $run");
        meld["run"].add(run);
        //print("melds $meld");
        findPossibleGinMelds(meld, L, meldInfo);
        var p = ginWinHand(
            L.sublist(0, lStart) + L.sublist(lStart + setLen), meldInfo, meld);
        //print("point- $p setLen - $setLen");
        if (p == 0) {
          return 0;
        }
        //print(" diff ${L.length - setLen}");
        meld["run"].removeLast();
        setLen++;
        lStart = lStart1;
        //print("L $L $lStart");
      } else {
        if (run.length > 0) {
          lStart += run.length;
          continue;
        }
      }
    }
    //print("L $L  lStart1 $lStart1 lStart $lStart");
    var p = ginWinSet(List.from(L), meldInfo, Map.from(meld));
    if(p == 0)
      return 0;
    lStart1++;
    lStart = lStart1;
    setLen = setLen1;
  }
  return getGinPoints(L);
}

int ginWinSet(List<int> L, GinMeldInfo meldInfo, var meld) {
  //print("GinWinSet $L");
  List<int> remainList = [];
  while (L.length >= 3) {
    List<int> set = findGinSet(L);
    if (set.length == 3) {
      if (!meld.containsKey("set")) {
        meld["set"] = [];
      }
      meld["set"].add(set);
      findPossibleGinMelds(meld, remainList + L, meldInfo);
      if (L.isEmpty && remainList.isEmpty) {
        return 0;
      }
      if (L.isNotEmpty) {
        var set2 = findGinSet(set + L, setLen: 4);
        if (set2.length == 4) {
          meld["set"].last.add(set2[3]);
          L.remove(set2[3]);
          findPossibleGinMelds(meld, remainList + L, meldInfo);
          if (L.isEmpty && remainList.isEmpty) {
            return 0;
          }
        }
      }
    } else if (set.length > 0) {
      for (var item in set) {
        remainList.add(item);
      }
    }
  }
  findPossibleGinMelds(meld, remainList + L, meldInfo);
  return getGinPoints(remainList + L);
}

List<int> findGinSet(List<int> L, {int setLen = 3}) {
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
  return set;
}
/*
void main() {
  var TS = [];
  
  var L = [0, 13, 26, 1, 2, 3, 4, 5, 6, 7];
  L.sort();
  TS.add(L);
  L = [1, 2, 3, 4, 5, 7, 8, 10, 11, 13];
  L.sort();
  TS.add(L);
  L = [1, 2, 3, 4, 5, 14, 15, 16, 11, 13];
  L.sort();
  TS.add(L);
  L = [0, 13, 26, 39, 40, 41, 43, 44, 45, 46];
  L.sort();
  TS.add(L);
  
  /* var */ L =[1,2,3,4,5,11,12,13,14,15];
  L.sort();
  TS.add(L);
  L = [0,13,26,39,1,14,27,40,2,15,28];
  L.sort();
  TS.add(L);
  L = [0,13,26,39,40,41,42,43,44,48];
  L.sort();
  TS.add(L);
  
  L = [0,1,2,4,17,30,3,16,29,5];
  L.sort();
  TS.add(L);
  TS.forEach((H) {
    print("hand -- $H");
    GinMeldInfo meldInfo = GinMeldInfo();
    var meld = {};
    var pts = GinWinHand(H, meldInfo, meld);
    print("result ------ ${meldInfo.mMelds}");
    print("dead wood -- ${meldInfo.mDeadwood}");
    print("points -- ${meldInfo.mPts}");
    print("sets ${meldInfo.sets}");
  });
}
*/

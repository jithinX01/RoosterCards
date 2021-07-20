const int JOKER = 52;

bool isWinningHand(List<int>? cards) {
  print("isWinningHand");
  print(cards);
  List<int> L = List.from(cards ?? []);
  if (L.length != 13) {
    return false;
  }
  L.sort();
  var jokers = findJokers(L);
  return winningHand(L, jokers, noOfJokers: jokers.length);
}

List<int> findRun(List<int> L, int lStart, List<int> jokers,
    {int noOfDeck = 1}) {
  List<int> run = [];
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
        } else {
          mstart += 1;
        }
      } else {
        break;
      }
    }
  }
  if (jokers.length + run.length >= 3) {
    while (run.length < 3 && jokers.isNotEmpty) {
      run.add(jokers.elementAt(0));
      jokers.removeAt(0);
    }
  }
  return run;
}

bool winningHand(List<int> L, List<int> jokers,
    {int noOfJokers = 0,
    int noOfDeck = 1,
    int lStart = 0,
    bool fourFound = false,
    bool pureRunFound = false,
    int setCount = 0}) {
  var setList = [];
  while ((L.length - lStart) + jokers.length >= 3) {
    List<int> run = findRun(L, lStart, jokers);
    //if find a run with len 3
    if (run.length == 3) {
      setCount += 1;
      int jkCount = noOfJokers - jokers.length;
      noOfJokers = jokers.length;
      if (lStart < L.length) {
        L = L.sublist(0, lStart) + L.sublist(lStart + (3 - jkCount));
      }
      //print("3------set, $run, $L");
      if (L.isEmpty && jokers.isEmpty) {
        bool valid = setCount == 4 && fourFound;
        if (valid) {
          setList.add(run);
          print("valid1 $valid");
          setList.forEach((set) {
            print(set);
          });
        }
        return valid;
      }

      //check sequence to next cards
      int lStart2 = lStart;
      bool valid = false;
      while ((L.length - lStart2) + jokers.length >= 3) {
        //call with the copy of list.
        valid = winningHand(
          List.from(L),
          List.from(jokers),
          noOfJokers: jokers.length,
          noOfDeck: noOfDeck,
          lStart: lStart2,
          setCount: setCount,
          fourFound: fourFound,
          pureRunFound: pureRunFound,
        );
        if (valid) {
          setList.add(run);
          setList.forEach((set) {
            print(set);
          });
          return valid;
        }
        lStart2 += 1;
      }
      //check for 4th run
      if (!valid && !fourFound) {
        if (lStart < L.length &&
            run[2] + 1 == L[lStart] &&
            run[2] ~/ 13 == L[lStart] ~/ 13) {
          run.add(L[lStart]);
          L.removeAt(lStart);
          fourFound = true;
        } else if (jokers.isNotEmpty) {
          run.add(jokers.elementAt(0));
          jokers.removeAt(0);
          fourFound = true;
        }
        //if four found
        if (fourFound) {
          //print("4------set, $run, $L");
          if (L.isEmpty && jokers.isEmpty) {
            bool valid = (setCount == 4);

            if (valid) {
              setList.add(run);
              print("valid2 $valid");
              setList.forEach((set) {
                print(set);
              });
            }
            return valid;
          }

          lStart2 = lStart;
          valid = false;
          while ((L.length - lStart2) + jokers.length >= 3) {
            //call with the copy of list.
            valid = winningHand(
              List.from(L),
              List.from(jokers),
              noOfJokers: jokers.length,
              noOfDeck: noOfDeck,
              lStart: lStart2,
              setCount: setCount,
              fourFound: fourFound,
              pureRunFound: pureRunFound,
            );
            if (valid) {
              setList.add(run);
              setList.forEach((set) {
                print(set);
              });
              return valid;
            }
            lStart2 += 1;
          }
        }
      }
      //l_start += 1;
      setList.add(run);
    } else {
      if (run.length > 0) {
        lStart += run.length;
        continue;
      }
      /* 
      else {
        l_start + 1;
      }
      */
    }
    lStart += 1;
  }

  var valid = winningSet(L, jokers, fourFound, setCount, pureRunFound);
  if (valid) {
    setList.forEach((set) {
      print(set);
    });
  }
  return valid;
}

bool winningSet(List<int> L, List<int> jokers, bool fourFound, int setCount,
    bool pureRunFound,
    {int noofDeck = 1}) {
  var setList = [];
  while (L.length + jokers.length >= 3) {
    List<int> set = findSet(L, jokers);
    if (set.length == 3) {
      setCount += 1;
      //print("3v------set, $set, $L");
      if (L.isEmpty && jokers.isEmpty) {
        bool valid = setCount == 4 && fourFound;
        if (valid) {
          print("valid3 $valid");
          setList.add(set);
          setList.forEach((set) {
            print(set);
          });
        }

        return valid;
      }
      if (!fourFound) {
        int index = set[2] + 13;
        if (index < 52 && L.contains(index)) {
          fourFound = true;
          set.add(index);
          L.remove(index);
        } else if (jokers.isNotEmpty) {
          fourFound = true;
          set.add(jokers.elementAt(0));
          jokers.removeAt(0);
        }
        //print("4v------set, $set, $L, $four_found");
        if (L.isEmpty && jokers.isEmpty) {
          bool valid = setCount == 4 && fourFound;

          if (valid) {
            print("valid4 $valid");
            setList.add(set);
            setList.forEach((set) {
              print(set);
            });
          }
          return valid;
        }
      }
      setList.add(set);
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
        if (L.contains(index)) {
          break;
        } else {
          index += 13;
        }
      } else {
        break;
      }
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

const String _c = "club";
const String _d = "diamond";
const String _h = "heart";
const String _s = "spade";
const String _j = "joker";

enum Suit {
  CLUB,
  DIAMOND,
  HEART,
  SPADE,
  JOKER,
}
const List<String> UTFPACK = [
  "🃑",
  "🃒",
  "🃓",
  "🃔",
  "🃕",
  "🃖",
  "🃗",
  "🃘",
  "🃙",
  "🃚",
  "🃛",
  "🃝",
  "🃞",
  "🃁",
  "🃂",
  "🃃",
  "🃄",
  "🃅",
  "🃆",
  "🃇",
  "🃈",
  "🃉",
  "🃊",
  "🃋",
  "🃍",
  "🃎",
  "🂱",
  "🂲",
  "🂳",
  "🂴",
  "🂵",
  "🂶",
  "🂷",
  "🂸",
  "🂹",
  "🂺",
  "🂻",
  "🂽",
  "🂾",
  "🂡",
  "🂢",
  "🂣",
  "🂤",
  "🂥",
  "🂦",
  "🂧",
  "🂨",
  "🂩",
  "🂪",
  "🂫",
  "🂭",
  "🂮"
];

class PCardInfo {
  final String val;
  final Suit suit;
  String get strSuit {
    switch (suit) {
      case Suit.CLUB:
        return _c;
      case Suit.DIAMOND:
        return _d;
      case Suit.HEART:
        return _h;
      case Suit.SPADE:
        return _s;
      case Suit.JOKER:
        return _j;
      default:
        return "";
    }
  }

  String get strUtf {
    switch (suit) {
      case Suit.CLUB:
        return "♣";
      case Suit.DIAMOND:
        return "♦";
      case Suit.HEART:
        return "♥";
      case Suit.SPADE:
        return "♠";
      case Suit.JOKER:
        return "🃏";
      default:
        return "";
    }
  }

  String get infoUtf {
    if (suit != Suit.JOKER)
      return val + " of " + strUtf;
    else
      return strUtf;
  }

  String get info {
    if (suit != Suit.JOKER)
      return val + " of " + strSuit;
    else
      return strSuit;
  }

  const PCardInfo(this.val, this.suit);
}

const PACK = <PCardInfo>[
  PCardInfo("A", Suit.CLUB),
  PCardInfo("2", Suit.CLUB),
  PCardInfo("3", Suit.CLUB),
  PCardInfo("4", Suit.CLUB),
  PCardInfo("5", Suit.CLUB),
  PCardInfo("6", Suit.CLUB),
  PCardInfo("7", Suit.CLUB),
  PCardInfo("8", Suit.CLUB),
  PCardInfo("9", Suit.CLUB),
  PCardInfo("10", Suit.CLUB),
  PCardInfo("J", Suit.CLUB),
  PCardInfo("Q", Suit.CLUB),
  PCardInfo("K", Suit.CLUB),
  PCardInfo("A", Suit.DIAMOND),
  PCardInfo("2", Suit.DIAMOND),
  PCardInfo("3", Suit.DIAMOND),
  PCardInfo("4", Suit.DIAMOND),
  PCardInfo("5", Suit.DIAMOND),
  PCardInfo("6", Suit.DIAMOND),
  PCardInfo("7", Suit.DIAMOND),
  PCardInfo("8", Suit.DIAMOND),
  PCardInfo("9", Suit.DIAMOND),
  PCardInfo("10", Suit.DIAMOND),
  PCardInfo("J", Suit.DIAMOND),
  PCardInfo("Q", Suit.DIAMOND),
  PCardInfo("K", Suit.DIAMOND),
  PCardInfo("A", Suit.HEART),
  PCardInfo("2", Suit.HEART),
  PCardInfo("3", Suit.HEART),
  PCardInfo("4", Suit.HEART),
  PCardInfo("5", Suit.HEART),
  PCardInfo("6", Suit.HEART),
  PCardInfo("7", Suit.HEART),
  PCardInfo("8", Suit.HEART),
  PCardInfo("9", Suit.HEART),
  PCardInfo("10", Suit.HEART),
  PCardInfo("J", Suit.HEART),
  PCardInfo("Q", Suit.HEART),
  PCardInfo("K", Suit.HEART),
  PCardInfo("A", Suit.SPADE),
  PCardInfo("2", Suit.SPADE),
  PCardInfo("3", Suit.SPADE),
  PCardInfo("4", Suit.SPADE),
  PCardInfo("5", Suit.SPADE),
  PCardInfo("6", Suit.SPADE),
  PCardInfo("7", Suit.SPADE),
  PCardInfo("8", Suit.SPADE),
  PCardInfo("9", Suit.SPADE),
  PCardInfo("10", Suit.SPADE),
  PCardInfo("J", Suit.SPADE),
  PCardInfo("Q", Suit.SPADE),
  PCardInfo("K", Suit.SPADE),
  PCardInfo("JOKER", Suit.JOKER)
];

enum Glass {
  shot("ショット", 30, "images/shot_30.png"),
  glass("グラス", 125, "images/wine_125.png"),
  cup("コップ", 150, "images/shot_30.png"),
  tokkuri("徳利", 180, "images/sake_180.png"),
  beerMugS("小ジョッキ", 200, "images/beer_jug.png"),
  beerMugM("ジョッキ", 300, "images/beer_jug.png"),
  can350("350ml缶", 350, "images/beer_350.png"),
  can500("500ml缶", 500, "images/beer_500.png");

  const Glass(this.name, this.amount, this.image);

  final String name;
  final int amount;
  final String image;
}

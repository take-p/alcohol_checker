enum Alcohol {
  sour("サワー", 3),
  beer("ビール", 5),
  wine("ワイン", 12),
  sake("日本酒", 15),
  shochu("焼酎", 25),
  spirits("蒸留酒", 50),
  fruitWine("果実酒", 20);

  const Alcohol(this.name, this.alcoholRate);

  final String name;
  final int alcoholRate;
}

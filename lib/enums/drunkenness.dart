import 'package:flutter/material.dart';

enum Drunkenness {
  a("無症状", "無症状でもお酒を飲んだら\n車の運転は控えましょう", Colors.indigo, "images/man_0.png", -0.1,
      0.3),
  b("爽快期", "気分爽快で陽気になる", Colors.blue, "images/man_1.png", 0.3, 0.5),
  c("ほろ酔い期", "抑制がとれる、理性が失われる", Colors.green, "images/man_3.png", 0.5, 1),
  d("酩酊初期", "立てばふらつく", Colors.amberAccent, "images/man_4.png", 1, 1.5),
  e("酩酊期", "吐き気・嘔吐が起きる", Colors.orange, "images/man_5.png", 1.5, 2.5),
  f("泥酔期", "意識がはっきりしない", Colors.red, "images/man_6.png", 2.5, 3.5),
  g("昏睡期", "死亡する可能性あり", Colors.purple, "images/man_7.png", 3.5, 4.5);

  const Drunkenness(this.name, this.description, this.color, this.image,
      this.startValue, this.endValue);

  final String name;
  final String description;
  final Color color;
  final String image;
  final double startValue;
  final double endValue;
}

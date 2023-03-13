import 'package:alcohol_checker/enums/drunkenness.dart';
import 'package:alcohol_checker/models/drink.dart';
import 'package:flutter/material.dart';

class DrinkHistory {
  DrinkHistory({
    required this.history,
    required this.undoHistory,
  });

  final List<Drink> history;
  final List<Drink> undoHistory;

  DrinkHistory drink(Drink drink) {
    return DrinkHistory(
      history: [...history, drink],
      undoHistory: [],
    );
  }

  DrinkHistory undo() {
    if (history.isEmpty) {
      return this;
    } else {
      return DrinkHistory(
        undoHistory: [...undoHistory, history.last],
        history: history.sublist(0, history.length - 1),
      );
    }
  }

  DrinkHistory redo() {
    if (undoHistory.isEmpty) {
      debugPrint("💥");
      return this;
    } else {
      return DrinkHistory(
        history: [...history, undoHistory.last],
        undoHistory: undoHistory.sublist(0, undoHistory.length - 1),
      );
    }
  }

  DrinkHistory clear() {
    return DrinkHistory(history: [], undoHistory: []);
  }

  // アルコール摂取量計算
  double calcAlcoholIntake() {
    return history.fold(
        0, (a, b) => a + b.glass.amount * b.alcohol.alcoholRate / 100 * 0.792);
  }

  // 血中アルコール濃度計算
  double calcBloodAlcohol(int aldh2) {
    //int aldh2 = 1; // 分解酵素係数
    int weight = 50; // 体重
    return calcAlcoholIntake() / (weight * 0.96) * aldh2;
  }

  // 現在の酔い
  Drunkenness checkDrunkenness(int aldh2) {
    double bloodAlcoholConcentration = calcBloodAlcohol(aldh2);
    for (Drunkenness drunkenness in Drunkenness.values.reversed) {
      debugPrint(
          "血中アルコール濃度 $bloodAlcoholConcentration > ${drunkenness.endValue}");

      if (bloodAlcoholConcentration > drunkenness.startValue) {
        return drunkenness;
      }
    }
    // 一つも超えなければ酔っていない
    return Drunkenness.a;
  }

  // 飲酒予測
  Drunkenness drinkPredict(Drink drink, int aldh2) {
    return this.drink(drink).checkDrunkenness(aldh2);
  }
}

import 'package:alcohol_checker/enums/drunkenness.dart';
import 'package:alcohol_checker/models/drinking_history.dart';
import 'package:alcohol_checker/providers/alcohol_tolerance_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/drink.dart';

final alcoholHistoryProvider =
    StateNotifierProvider<AlcoholHistoryNotifier, DrinkHistory>(
  (ref) => AlcoholHistoryNotifier(DrinkHistory(history: [], undoHistory: []),
      ref.watch(alcoholToleranceProvider).coefficient),
);

class AlcoholHistoryNotifier extends StateNotifier<DrinkHistory> {
  AlcoholHistoryNotifier(DrinkHistory alcoholHistory, this.aldh2)
      : super(alcoholHistory);

  final int aldh2;

  // 飲む
  void drink(Drink drink) {
    state = state.drink(drink);
  }

  // undo
  void undo() {
    state = state.undo();
  }

  // redo
  void redo() {
    state = state.redo();
  }

  // clear
  void clear() {
    state = state.clear();
  }

  // 血中アルコール度数
  double getBloodAlcohol() {
    return state.calcBloodAlcohol(aldh2);
  }

  // 現在の状態を確認
  Drunkenness checkDrunkenness() {
    return state.checkDrunkenness(aldh2);
  }

  // 飲んだ後の状態を予測
  Drunkenness drinkPredict(Drink drink) {
    return state.drinkPredict(drink, aldh2);
  }
}

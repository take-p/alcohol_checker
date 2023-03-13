import 'package:alcohol_checker/enums/alcohol_tolerance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final alcoholToleranceProvider =
    StateNotifierProvider<AlcoholToleranceNotifier, AlcoholTolerance>(
  (ref) => AlcoholToleranceNotifier(AlcoholTolerance.nn),
);

class AlcoholToleranceNotifier extends StateNotifier<AlcoholTolerance> {
  AlcoholToleranceNotifier(AlcoholTolerance alcoholTolerance)
      : super(alcoholTolerance);

  void selectAlcoholTolerance(AlcoholTolerance alcoholTolerance) {
    state = alcoholTolerance;
  }
}

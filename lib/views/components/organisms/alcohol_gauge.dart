import 'package:alcohol_checker/providers/alcohol_history_provider.dart';
import 'package:alcohol_checker/providers/alcohol_tolerance_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../enums/drunkenness.dart';

class AlcoholGauge extends ConsumerWidget {
  const AlcoholGauge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alcoholHistory = ref.watch(alcoholHistoryProvider);
    final alcoholTolerance = ref.watch(alcoholToleranceProvider);

    return SfLinearGauge(
      maximum: Drunkenness.values.last.endValue,
      markerPointers: [
        LinearShapePointer(
          value: alcoholHistory.calcBloodAlcohol(alcoholTolerance.coefficient),
        ),
      ],
      ranges: [
        ...Drunkenness.values.map((e) => LinearGaugeRange(
              startValue: e.startValue,
              endValue: e.endValue,
              color: e.color,
            )),
      ],
    );
  }
}

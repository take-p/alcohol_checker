import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../enums/alcohol_tolerance.dart';
import '../../../providers/alcohol_tolerance_provider.dart';
import '../atoms/expanded_button.dart';

class AlcoholToleranceSelector extends ConsumerWidget {
  const AlcoholToleranceSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectAlcoholTolerance =
        ref.watch(alcoholToleranceProvider); // アルコール耐性
    final alcoholToleranceNotifier =
        ref.watch(alcoholToleranceProvider.notifier);

    return Row(
      children: [
        for (AlcoholTolerance x in AlcoholTolerance.values)
          ExpandedButton(
            text: x.name,
            backgroundColor:
                selectAlcoholTolerance == x ? Colors.blue : Colors.grey,
            onPressed: () {
              alcoholToleranceNotifier.selectAlcoholTolerance(x);
            },
          ),
      ],
    );
  }
}

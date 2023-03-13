import 'package:alcohol_checker/providers/alcohol_history_provider.dart';
import 'package:alcohol_checker/providers/alcohol_tolerance_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrunkennessImage extends ConsumerWidget {
  const DrunkennessImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alcoholHistory = ref.watch(alcoholHistoryProvider);
    final alcoholTolerance = ref.watch(alcoholToleranceProvider);

    final drunkenness =
        alcoholHistory.checkDrunkenness(alcoholTolerance.coefficient);

    return Container(
      height: 100,
      width: double.infinity,
      color: drunkenness.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(drunkenness.image),
            width: 100,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                drunkenness.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                alcoholHistory
                    .checkDrunkenness(alcoholTolerance.coefficient)
                    .description,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}

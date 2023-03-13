import 'package:alcohol_checker/providers/alcohol_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../atoms/expanded_button.dart';

class HistoryControlPanel extends ConsumerWidget {
  const HistoryControlPanel({
    super.key,
    required this.alcoholIntake,
    required this.bloodAlcoholConcentration,
  });

  final ValueNotifier<double> alcoholIntake;
  final ValueNotifier<double> bloodAlcoholConcentration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alcoholHistory = ref.watch(alcoholHistoryProvider);
    final alcoholHistoryNotifier = ref.watch(alcoholHistoryProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExpandedButton(
          onPressed: alcoholHistoryNotifier.undo,
          backgroundColor:
              alcoholHistory.history.isNotEmpty ? Colors.blue : Colors.grey,
          text: "戻る",
          icon: Icons.undo,
        ),
        ExpandedButton(
          onPressed: alcoholHistoryNotifier.redo,
          backgroundColor:
              alcoholHistory.undoHistory.isNotEmpty ? Colors.blue : Colors.grey,
          text: "進む",
          icon: Icons.redo,
        ),
        ExpandedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: const Text('ここまでの飲酒記録をリセットしますか？'),
                contentPadding: const EdgeInsets.all(20.0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("キャンセル"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.red),
                        onPressed: () {
                          alcoholHistoryNotifier.clear();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("削除"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          text: "リセット",
          backgroundColor: Colors.red,
          icon: Icons.clear,
        ),
      ],
    );
  }
}

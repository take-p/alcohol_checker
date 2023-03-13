import 'package:alcohol_checker/providers/alcohol_history_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlcoholHistoryPanel extends ConsumerWidget {
  const AlcoholHistoryPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alcoholHistory = ref.watch(alcoholHistoryProvider);

    return SizedBox(
      height: 50,
      //color: Colors.grey,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = alcoholHistory.history.length; i > 0; i--)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: Chip(
                avatar: CircleAvatar(
                  child: Text("$i"),
                ),
                label: Text(alcoholHistory.history[i - 1].alcohol.name),
                //onDeleted: () {},
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:alcohol_checker/models/drink.dart';
import 'package:alcohol_checker/providers/alcohol_history_provider.dart';
import 'package:alcohol_checker/providers/alcohol_tolerance_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../enums/alcohol_list.dart';
import '../../../enums/glasses.dart';

class AlcoholAccordionPanel extends ConsumerWidget {
  const AlcoholAccordionPanel({
    super.key,
    required this.expandedAccordionIndexList,
  });

  final ValueNotifier<List<int>> expandedAccordionIndexList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alcoholHistory = ref.watch(alcoholHistoryProvider);
    final alcoholHistoryNotifier = ref.watch(alcoholHistoryProvider.notifier);
    final aldh2 = ref.watch(alcoholToleranceProvider);

    return ListView(
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            for (var e in Alcohol.values) {
              expandedAccordionIndexList.value = [];
            }
            expandedAccordionIndexList.value.add(index);
          },
          children: [
            for (Alcohol alcohol in Alcohol.values) ...[
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded:
                    expandedAccordionIndexList.value.contains(alcohol.index),
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(alcohol.name[0]),
                    ),
                    title: Text(alcohol.name),
                    subtitle: Text("アルコール度数 ${alcohol.alcoholRate} %"),
                  );
                },
                body: SizedBox(
                  height: 75,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (Glass glass in Glass.values) ...[
                        InkWell(
                          onTap: () {
                            alcoholHistoryNotifier.drink(
                              Drink(glass: glass, alcohol: alcohol),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            width: 60,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: alcoholHistory
                                      .drinkPredict(
                                        Drink(glass: glass, alcohol: alcohol),
                                        aldh2.coefficient,
                                      )
                                      .color,
                                  child: Image(
                                    image: AssetImage(glass.image),
                                    height: 50,
                                  ),
                                ),
                                Text(
                                  glass.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              )
            ],
          ],
          animationDuration: const Duration(milliseconds: 500),
          //elevation: 1,
        ),
      ],
    );
  }
}

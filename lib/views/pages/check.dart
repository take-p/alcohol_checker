import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/organisms/alcohol_accordion_panel.dart';
import '../components/organisms/alcohol_gauge.dart';
import '../components/organisms/alcohol_history_panel.dart';
import '../components/organisms/alcohol_tolerance_selector.dart';
import '../components/organisms/drunknness_image.dart';
import '../components/organisms/history_control_panel.dart';

class AlcoholCheckPage extends HookConsumerWidget {
  const AlcoholCheckPage({super.key}); // redo

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 拡張したアコーディオンのindexのリスト
    final expandedAccordionIndexList = useState<List<int>>([]);

    // final DateTime time = DateTime.now(); // 時刻

    return Scaffold(
        appBar: AppBar(title: const Text("アルコールチェック")),
        body: Column(
          children: [
            const DrunkennessImage(),
            // Text(
            //   DateFormat.Hms().format(time),
            //   style: const TextStyle(fontSize: 30),
            // ),
            const AlcoholToleranceSelector(),
            const Padding(
              padding: EdgeInsets.all(10),
              child: AlcoholGauge(),
            ),
            const HistoryControlPanel(),
            const AlcoholHistoryPanel(),
            Expanded(
              child: AlcoholAccordionPanel(
                expandedAccordionIndexList: expandedAccordionIndexList,
              ),
            ),
          ],
        ));
  }
}

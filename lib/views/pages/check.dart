import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../enums/alcohol_tolerance.dart';
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
    final alcoholIntake = useState<double>(0); // アルコール摂取量[g]
    final bloodAlcoholConcentration = useState<double>(0); // 血中アルコール濃度[g/ml]
    // 拡張したアコーディオンのindexのリスト
    final expandedAccordionIndexList = useState<List<int>>([]);

    final selectAlcoholTolerance = useState(AlcoholTolerance.dd); // アルコール耐性

    final DateTime time = DateTime.now(); // 時刻

    return Scaffold(
        appBar: AppBar(title: const Text("アルコールチェック")),
        body: Column(
          children: [
            const DrunkennessImage(),
            Text(
              DateFormat.Hms().format(time),
              style: const TextStyle(
                  fontSize: 30), //Theme.of(context).textTheme.headline2,
            ),
            const AlcoholToleranceSelector(),
            const Padding(
              padding: EdgeInsets.all(10),
              child: AlcoholGauge(),
            ),
            HistoryControlPanel(
              alcoholIntake: alcoholIntake,
              bloodAlcoholConcentration: bloodAlcoholConcentration,
            ),
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

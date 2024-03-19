import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';
import 'package:provider/provider.dart';

import '../widgets/chaos_factor.dart';
import '../widgets/gap.dart';
import '../widgets/output.dart';

enum SceneState {
  expected,
  altered,
  interrupt,
}

Map<SceneState, String> sceneLabels = {
  SceneState.expected: 'Expected Scene',
  SceneState.altered: 'Altered Scene',
  SceneState.interrupt: 'Interrupt Scene'
};

class SceneStateResult {
  final String outcome = '';
  final String info = '';

  SceneStateResult(
    String outcome,
    String info,
  ) {
    outcome = this.outcome;
    info = this.info;
  }
}

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  String outputText = '...';
  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      Output(
        text: [outputText],
      ),
      const Text('Journal View'),
      const Text('Filter needed'),
      ListButton(
        label: 'Test Your Expected Scene',
        onPressed: () => setState(() {
          outputText = testScene(context);
        }),
      ),
      ListButton(
        label: 'Detail Check',
        onPressed: () {},
      ),
      ListButton(
        label: 'Event Check',
        onPressed: () {},
      ),
      const Gap(),
      ListButton(
        label: 'Fate Check',
        onPressed: () {},
      ),
      ListButton(
        label: 'End Scene',
        onPressed: () {},
      )
    ]);
  }

  String testScene(BuildContext context) {
    int d10 = Random().nextInt(10) + 1;
    var chaosFactor = context.read<ChaosFactor>().value;

    if (d10 > chaosFactor) {
      return 'Expected\nd10 roll = $d10 > CF $chaosFactor';
    }
    if (d10.isEven) {
      return 'Altered\nd10 roll = $d10 (Odd) < CF $chaosFactor';
    } else {
      return 'Interrupt\nd10 roll = $d10 (Even) < CF $chaosFactor';
    }
  }
}

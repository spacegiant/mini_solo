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

class ReturnObject {
  late String line1;
  late String? line2;
  late String? line3;

  ReturnObject({
    required this.line1,
    this.line2,
    this.line3,
  });
}

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _JournalViewState();
}

class _JournalViewState extends State<JournalView> {
  String line1 = '...';
  String? line2;
  String? line3;

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(children: [
      Output(
        line1: line1,
        line2: line2,
        line3: line3,
      ),
      const Text('Journal View'),
      const Text('Filter needed'),
      ListButton(
          label: 'Test Your Expected Scene',
          onPressed: () {
            ReturnObject test = testScene(context);
            setState(() {
              line1 = test.line1;
              line2 = test.line2;
              line3 = test.line3;
            });
          }),
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

  ReturnObject testScene(BuildContext context) {
    int d10 = Random().nextInt(10) + 1;
    var chaosFactor = context.read<ChaosFactor>().value;

    if (d10 > chaosFactor) {
      // return 'Expected\nd10 roll = $d10 > CF $chaosFactor';
      return ReturnObject(
        line1: 'Expected',
        line3: 'd10 roll = $d10 > CF $chaosFactor',
      );
    }
    if (d10.isEven) {
      // return 'Altered\nd10 roll = $d10 (Odd) < CF $chaosFactor';
      return ReturnObject(
        line1: 'Altered',
        line3: 'd10 roll = $d10 (Odd) < CF $chaosFactor',
      );
    } else {
      // return 'Interrupt\nd10 roll = $d10 (Even) < CF $chaosFactor';
      return ReturnObject(
        line1: 'Interrupt',
        line3: 'd10 roll = $d10 (Even) < CF $chaosFactor',
      );
    }
  }
}

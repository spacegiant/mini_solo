import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/output.dart';
import 'package:mini_solo/widgets/view_wrapper.dart';

import '../widgets/gap.dart';

class DiceView extends StatelessWidget {
  const DiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewWrapper(
      children: [
        Output(line1: '...'),
        DiceCollection(),
        Gap(),
        DiceCollection(),
        Gap(),
        Text('Traditional dice'),
        Text('Zocchi dice'),
        Text('Genesys dice'),
        Text('Story dice'),
      ],
    );
  }
}

class DiceCollection extends StatelessWidget {
  const DiceCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3.0,
            color: CupertinoColors.systemRed,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          const Text('Traditional Set'),
          const Gap(),
          Wrap(
            runSpacing: 8.0,
            spacing: 8.0,
            children: [
              CupertinoButton(
                  color: CupertinoColors.systemPink,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'd4',
                  ),
                  onPressed: () {}),
              CupertinoButton(
                  color: CupertinoColors.systemPink,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'd6',
                  ),
                  onPressed: () {}),
              CupertinoButton(
                  color: CupertinoColors.systemPink,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'd8',
                  ),
                  onPressed: () {}),
              CupertinoButton(
                  color: CupertinoColors.systemPink,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'd10',
                  ),
                  onPressed: () {}),
              CupertinoButton(
                  color: CupertinoColors.systemPink,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'd12',
                  ),
                  onPressed: () {}),
              CupertinoButton(
                  color: CupertinoColors.systemPink,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'd20',
                  ),
                  onPressed: () {}),
              CupertinoButton(
                  color: CupertinoColors.systemPink,
                  padding: const EdgeInsets.all(0.0),
                  child: const Text(
                    'd100',
                  ),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

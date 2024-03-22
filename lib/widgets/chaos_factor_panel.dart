import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'list_button.dart';

class ChaosFactorPanel extends StatelessWidget {
  const ChaosFactorPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Chaos Factor'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListButton(
                labelAlignment: Alignment.center,
                label: 'Up',
                onPressed: () {
                  var chaosFactor = context.read<AppState>();
                  chaosFactor.increaseChaosFactor();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Consumer<AppState>(
                builder: (context, chaosFactor, child) => SizedBox(
                  width: 30.0,
                  child: Center(
                    child: Text(
                      chaosFactor.chaosFactor.toString(),
                      style: const TextStyle(
                          fontSize: 36.0, color: CupertinoColors.systemPink),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListButton(
                labelAlignment: Alignment.center,
                label: 'Down',
                onPressed: () {
                  var chaosFactor = context.read<AppState>();
                  chaosFactor.decreaseChaosFactor();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../data/app_state.dart';
import 'list_button.dart';

class ChaosFactorPopup extends StatelessWidget {
  const ChaosFactorPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();

    return SizedBox(
      width: 200.0,
      height: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: Text('Set Chaos Factor')),
          Center(
            child: Consumer<AppState>(
              builder: (BuildContext context, appState, Widget? child) {
                return Text(
                  '${appState.chaosFactor}',
                  style: const TextStyle(
                    fontSize: 40.0,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            width: 10.0,
            height: 10.0,
          ),
          ListButton(
            label: 'Chaos Up',
            labelAlignment: Alignment.center,
            onPressed: () {
              appState.increaseChaosFactor();
            },
          ),
          ListButton(
            label: 'Chaos Down',
            labelAlignment: Alignment.center,
            onPressed: () {
              appState.decreaseChaosFactor();
            },
          ),
          ListButton(
            label: 'Reset',
            labelAlignment: Alignment.center,
            onPressed: () {
              appState.resetChaosFactor();
            },
          ),
          ListButton(
            label: 'Close',
            labelAlignment: Alignment.center,
            onPressed: () => appState.toggleShowPopup(null),
          ),
        ],
      ),
    );
  }
}

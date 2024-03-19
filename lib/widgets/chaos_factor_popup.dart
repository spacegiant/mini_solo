import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'list_button.dart';

class ChaosFactorPopup extends StatelessWidget {
  const ChaosFactorPopup({
    super.key,
    // required this.togglePopup,
  });

  // final Function() togglePopup;

  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();

    return SizedBox(
      width: 200.0,
      height: 200.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: Text('Set Chaos Factor')),
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
            label: 'Close',
            labelAlignment: Alignment.center,
            onPressed: appState.toggleShowPopup,
          ),
        ],
      ),
    );
  }
}

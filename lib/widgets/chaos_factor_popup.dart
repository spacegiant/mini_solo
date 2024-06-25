import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/app_state.dart';
import 'gap.dart';
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
          const Center(child: Text(kChaosFactorTitle)),
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
          ListButton(
            label: kChaosFactorUp,
            labelAlignment: Alignment.center,
            onPressed: () {
              appState.increaseChaosFactor();
            },
          ),
          const Gap(height: 8.0),
          ListButton(
            label: kChaosFactorDown,
            labelAlignment: Alignment.center,
            onPressed: () {
              appState.decreaseChaosFactor();
            },
          ),
          const Gap(height: 8.0),
          ListButton(
            label: kChaosFactorReset,
            labelAlignment: Alignment.center,
            onPressed: () {
              appState.resetChaosFactor();
            },
          ),
          const Gap(height: 8.0),
          ListButton(
            label: kPopupCloseButtonLabel,
            labelAlignment: Alignment.center,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

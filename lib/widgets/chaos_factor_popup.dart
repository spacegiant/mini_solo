import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../utilities/app_state.dart';
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
      height: 240.0,
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
              appState.saveCampaignDataToDisk();
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

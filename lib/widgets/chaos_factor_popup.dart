import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data/app_state.dart';
import 'gap.dart';
import 'list_button.dart';

class ChaosFactorPopup extends StatefulWidget {
  const ChaosFactorPopup({
    super.key,
  });

  @override
  State<ChaosFactorPopup> createState() => _ChaosFactorPopupState();
}

class _ChaosFactorPopupState extends State<ChaosFactorPopup> {
  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppState>();

    return Column(
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
      ],
    );
  }
}

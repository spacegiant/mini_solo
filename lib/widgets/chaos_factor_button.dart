import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../utilities/app_state.dart';

class ChaosFactorButton extends StatelessWidget {
  const ChaosFactorButton({super.key, required this.togglePopup});

  final Function() togglePopup;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: togglePopup,
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer<AppState>(
            builder: (context, appState, child) => Text(
              'CF ${appState.chaosFactor}',
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}

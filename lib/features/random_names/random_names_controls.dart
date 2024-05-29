import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

import '../../data/app_state.dart';

class RandomNames extends StatelessWidget {
  const RandomNames({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return WrapManager(
      wrapControls: true,
      children: [
        ListButton(
            label: 'Add new table',
            onPressed: () {
              appState.toggleShowPopup(
                label: PopupLabels.addRandomTable,
              );
            }),
      ],
    );
  }
}

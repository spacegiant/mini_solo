import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/wrap_manager.dart';

class TrackerControls extends StatelessWidget {
  const TrackerControls({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return WrapManager(wrapControls: true, children: [
      ListButton(
        iconData: CupertinoIcons.add,
        label: 'Add',
        onPressed: () {
          // TODO: Open Create Tracker Popup
          appState.toggleShowPopup(
            label: PopupLabel.manageTracker,
          );
        },
      )
    ]);
  }
}

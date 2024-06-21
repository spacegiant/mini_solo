import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';

class EditGroupPopup extends StatelessWidget {
  final AppState appState;
  // final String groupId;

  const EditGroupPopup({
    super.key,
    required this.appState,
    // required this.groupId,
  });

  @override
  Widget build(BuildContext context) {
    // Current Group
    String groupId = appState.currentEntryId;
    Group currentGroup = appState.getGroup(groupId);
    List<String> controls = currentGroup.controls;
    List<Widget> widgets;

    for (final control in controls) {
      print(control);
    }

    return Column(
      children: [
        Text(groupId),
      ],
    );
  }
}

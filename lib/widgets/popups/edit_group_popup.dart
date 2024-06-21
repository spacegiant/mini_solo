import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

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

    return Text(groupId);
  }
}

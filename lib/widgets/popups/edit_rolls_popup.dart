import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

class EditRollPopup extends StatefulWidget {
  const EditRollPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<EditRollPopup> createState() => _EditRollPopupState();
}

class _EditRollPopupState extends State<EditRollPopup> {
  @override
  Widget build(
    BuildContext context,
  ) {
    String currentEntryId = widget.appState.currentEntryId;

    return Column(
      children: [
        const Text('Delete Entry'),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteRollEntry(currentEntryId);
            widget.appState.closePopup();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

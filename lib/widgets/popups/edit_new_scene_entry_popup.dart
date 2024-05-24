import 'package:flutter/cupertino.dart';

import '../../data/app_state.dart';

class EditNewSceneEntryPopup extends StatefulWidget {
  const EditNewSceneEntryPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<EditNewSceneEntryPopup> createState() => _EditNewSceneEntryPopupState();
}

class _EditNewSceneEntryPopupState extends State<EditNewSceneEntryPopup> {
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
            widget.appState.deleteNewSceneEntry(currentEntryId);
            widget.appState.closePopup();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

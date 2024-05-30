import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../gap.dart';

class EditRollTableResultPopup extends StatefulWidget {
  const EditRollTableResultPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<EditRollTableResultPopup> createState() => _EditMythicEntryPopupState();
}

class _EditMythicEntryPopupState extends State<EditRollTableResultPopup> {
  @override
  Widget build(
    BuildContext context,
  ) {
    String currentEntryId = widget.appState.currentEntryId;

    return Column(
      children: [
        const Text(kPopupDeleteEntryLabel),
        const Gap(),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteRandomTableResultsEntry(currentEntryId);
            widget.appState.closePopup();
          },
          child: const Text(kDeleteLabel),
        ),
      ],
    );
  }
}

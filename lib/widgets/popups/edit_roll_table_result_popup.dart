import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../gap.dart';

class EditRollTableResultPopup extends StatefulWidget {
  const EditRollTableResultPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditRollTableResultPopup> createState() => _EditMythicEntryPopupState();
}

class _EditMythicEntryPopupState extends State<EditRollTableResultPopup> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        const Text(kPopupDeleteEntryLabel),
        const Gap(),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteRandomTableResultsEntry(widget.id);
            widget.appState.closePopup();
          },
          child: const Text(kDeleteLabel),
        ),
      ],
    );
  }
}

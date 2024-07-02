import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';

import '../../constants.dart';
import '../../data/app_state.dart';

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
    return PopupLayout(
      header: const Text(kPopupDeleteEntryLabel),
      footer: CupertinoButton(
        color: CupertinoColors.destructiveRed,
        onPressed: () {
          widget.appState.deleteRandomTableResultsEntry(widget.id);
          Navigator.pop(context);
        },
        child: const Text(kDeleteLabel),
      ),
    );
  }
}

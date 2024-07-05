import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../data/app_state.dart';

class EditRollPopup extends StatefulWidget {
  const EditRollPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditRollPopup> createState() => _EditRollPopupState();
}

class _EditRollPopupState extends State<EditRollPopup> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return PopupLayout(
      header: const PopupLayoutHeader(label: kPopupDeleteEntryLabel),
      footer: CupertinoButton(
        color: CupertinoColors.destructiveRed,
        onPressed: () {
          widget.appState.deleteRollEntry(widget.id);
          Navigator.pop(context);
        },
        child: const Text('Delete'),
      ),
    );
  }
}

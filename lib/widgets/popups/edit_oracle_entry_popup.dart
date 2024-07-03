import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../data/app_state.dart';

class EditOracleEntryPopup extends StatefulWidget {
  const EditOracleEntryPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditOracleEntryPopup> createState() => _EditMythicEntryPopupState();
}

class _EditMythicEntryPopupState extends State<EditOracleEntryPopup> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return PopupLayout(
      header: const PopupLayoutHeader(label: kPopupDeleteEntryLabel),
      footer: CupertinoButton(
        color: CupertinoColors.destructiveRed,
        onPressed: () {
          widget.appState.deleteOracleEntry(widget.id);
          Navigator.pop(context);
        },
        child: const Text(kDeleteLabel),
      ),
    );
  }
}

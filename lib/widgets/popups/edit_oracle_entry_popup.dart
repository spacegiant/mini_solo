import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../gap.dart';

class EditOracleEntryPopup extends StatefulWidget {
  const EditOracleEntryPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<EditOracleEntryPopup> createState() => _EditMythicEntryPopupState();
}

class _EditMythicEntryPopupState extends State<EditOracleEntryPopup> {
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
            widget.appState.deleteOracleEntry(currentEntryId);
            widget.appState.closePopup();
          },
          child: const Text(kDeleteLabel),
        ),
      ],
    );
  }
}

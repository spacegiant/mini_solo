import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../gap.dart';

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
    return Column(
      children: [
        const Text(kPopupDeleteEntryLabel),
        const Gap(),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteOracleEntry(widget.id);
            widget.appState.closePopup();
          },
          child: const Text(kDeleteLabel),
        ),
      ],
    );
  }
}

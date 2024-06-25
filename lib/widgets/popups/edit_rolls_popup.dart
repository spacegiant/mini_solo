import 'package:flutter/cupertino.dart';

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
    return Column(
      children: [
        const Text('Delete Entry'),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteRollEntry(widget.id);
            widget.appState.closePopup();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../gap.dart';

class EditMythicEntryPopup extends StatefulWidget {
  const EditMythicEntryPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditMythicEntryPopup> createState() => _EditMythicEntryPopupState();
}

class _EditMythicEntryPopupState extends State<EditMythicEntryPopup> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return PopupLayout(
        header: const Text(kPopupDeleteEntryLabel),
        footer: CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteMythicEntry(widget.id);
            Navigator.pop(context);
          },
          child: const Text(kDeleteLabel),
        ));
    return Column(
      children: [
        const Text(kPopupDeleteEntryLabel),
        const Gap(),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteMythicEntry(widget.id);
            Navigator.pop(context);
          },
          child: const Text(kDeleteLabel),
        ),
      ],
    );
  }
}

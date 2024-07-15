import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../constants.dart';

class EditResultPopup extends StatelessWidget {
  final AppState appState;
  final String id;

  const EditResultPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return PopupLayout(
      header: const PopupLayoutHeader(label: kPopupDeleteEntryLabel),
      footer: CupertinoButton(
        color: CupertinoColors.destructiveRed,
        onPressed: () {
          appState.deleteResultEntry(id);
          Navigator.pop(context);
        },
        child: const Text(kDeleteLabel),
      ),
    );
  }
}

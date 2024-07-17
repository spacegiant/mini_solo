import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_state.dart';
import 'package:mini_solo/data/data_structures/journal_entry_item.dart';
import 'package:mini_solo/widgets/label_and_text_area.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../constants.dart';
import '../../widgets/gap.dart';

class EditResultPopup extends StatefulWidget {
  final AppState appState;
  final String id;

  const EditResultPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  @override
  State<EditResultPopup> createState() => _EditResultPopupState();
}

class _EditResultPopupState extends State<EditResultPopup> {
  late TextEditingController _controller;
  late JournalEntryItem? journalEntryItem;

  @override
  void initState() {
    super.initState();

    JournalEntryItem? journalEntryItem = widget.appState.campaignData?.journal
        .firstWhereOrNull((entry) => entry.id == widget.id);

    _controller = TextEditingController(text: journalEntryItem?.note);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupLayout(
      header: const PopupLayoutHeader(label: kPopupDeleteEntryLabel),
      body: LabelAndTextArea(
        label: 'Note',
        controller: _controller,
        onChanged: (value) {
          setState(() {
            _controller.text = value;
          });
        },
      ),
      footer: Row(
        children: [
          ListButton(
            color: kSubmitColor,
            onPressed: () {
              widget.appState.updateJournalEntry(
                widget.id,
                _controller.value.text,
              );
              Navigator.pop(context);
            },
            label: const Text('Update Entry'),
          ),
          const Gap(),
          ListButton(
            color: kWarningColor,
            onPressed: () {
              widget.appState.deleteResultEntry(widget.id);
              Navigator.pop(context);
            },
            label: const Text('Delete Entry'),
          ),
        ],
      ),
    );
  }
}

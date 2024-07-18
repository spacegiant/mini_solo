import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../data/data_structures/journal_entry_item.dart';
import '../gap.dart';
import '../label_and_text_area.dart';

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
  Widget build(
    BuildContext context,
  ) {
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
            color: CupertinoColors.destructiveRed,
            onPressed: () {
              widget.appState.deleteRandomTableResultsEntry(widget.id);
              Navigator.pop(context);
            },
            label: const Text('Delete Entry'),
          ),
        ],
      ),
    );
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';
import '../../data/app_state.dart';
import '../../data/data_structures/journal_entry_item.dart';
import '../../data/note_entry_item.dart';
import '../gap.dart';
import '../label_and_text_area.dart';

class EditNotePopup extends StatefulWidget {
  const EditNotePopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditNotePopup> createState() => _EditNotePopupState();
}

class _EditNotePopupState extends State<EditNotePopup> {
  late TextEditingController _controller;
  late TextEditingController _noteController;
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    JournalEntryItem? journalEntryItem = widget.appState.campaignData?.journal
        .firstWhereOrNull((entry) => entry.id == widget.id);
    _noteController = TextEditingController(text: journalEntryItem?.note);
  }

  @override
  void dispose() {
    _controller.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NoteEntryItem entry = widget.appState.campaignData!.notes
        .firstWhere((entry) => entry.id == widget.id);

    if (_controller.text == '') {
      setState(() {
        _controller.text = entry.detail;
      });
    }

    return PopupLayout(
      header: const PopupLayoutHeader(label: 'Edit Note Entry'),
      body: Column(
        children: [
          CupertinoTextField(
            key: _key,
            controller: _controller,
            placeholder: 'Type here',
            autofocus: true,
            minLines: 4,
            maxLines: 4,
            textCapitalization: TextCapitalization.sentences,
          ),
          const Gap(),
          LabelAndTextArea(
            label: 'Note',
            controller: _noteController,
            onChanged: (value) {
              setState(() {
                _noteController.text = value;
              });
            },
          ),
        ],
      ),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
              color: CupertinoColors.systemGreen,
              onPressed: () {
                widget.appState.updateNoteItem(widget.id, _controller.text);
                widget.appState.updateJournalEntry(
                  widget.id,
                  _noteController.value.text,
                );
                Navigator.pop(context);
              },
              child: const Text('Submit')),
          const Gap(),
          CupertinoButton(
            color: CupertinoColors.destructiveRed,
            onPressed: () {
              widget.appState.deleteNoteItem(widget.id);
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

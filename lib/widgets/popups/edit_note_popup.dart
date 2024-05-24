import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/app_state.dart';
import '../../data/note_entry_item.dart';

class EditNotePopup extends StatefulWidget {
  const EditNotePopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<EditNotePopup> createState() => _EditNotePopupState();
}

class _EditNotePopupState extends State<EditNotePopup> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    String currentEntryId = widget.appState.currentEntryId;
    NoteEntryItem entry = widget.appState.campaignData!.notes
        .firstWhere((entry) => entry.id == currentEntryId);

    if (_controller.text == '') {
      setState(() {
        _controller.text = entry.detail;
      });
    }

    return Column(
      children: [
        CupertinoTextField(
          controller: _controller,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.zero,
            color: Colors.transparent,
          ),
          placeholder: 'Type here',
          autofocus: true,
          expands: true,
          minLines: null,
          maxLines: null,
        ),
        CupertinoButton(
            child: const Text('Submit'),
            onPressed: () {
              // update the record

              // NoteEntryItem entry = appState.campaignData!.notes
              //     .firstWhere((entry) => entry.id == journalEntry.id);

              entry.detail = _controller.text;
            })
      ],
    );
  }
}

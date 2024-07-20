import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

import '../../data/app_state.dart';
import '../../data/data_structures/journal_entry_item.dart';
import '../../data/data_structures/new_scene_entry.dart';
import '../gap.dart';
import '../label_and_text_area.dart';
import '../list_button.dart';

class EditNewSceneEntryPopup extends StatefulWidget {
  const EditNewSceneEntryPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditNewSceneEntryPopup> createState() => _EditNewSceneEntryPopupState();
}

class _EditNewSceneEntryPopupState extends State<EditNewSceneEntryPopup> {
  late TextEditingController _controller;
  late TextEditingController _noteController;

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
  Widget build(
    BuildContext context,
  ) {
    NewSceneEntry entry = widget.appState.campaignData!.newScene
        .firstWhere((entry) => entry.id == widget.id);

    if (_controller.text == '') {
      setState(() {
        _controller.text = entry.label;
      });
    }

    return PopupLayout(
      header: const PopupLayoutHeader(label: 'Edit Scene Marker'),
      body: Column(
        children: [
          CupertinoTextField(controller: _controller),
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
      footer: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ListButton(
              color: CupertinoColors.systemGreen,
              onPressed: () {
                widget.appState.updateNewScene(widget.id, _controller.text);
                widget.appState.updateJournalEntry(
                  widget.id,
                  _noteController.value.text,
                );
                Navigator.pop(context);
              },
              label: const Text('Update Marker'),
            ),
            const Gap(),
            ListButton(
              color: kWarningColor,
              onPressed: () {
                widget.appState.deleteNewSceneEntry(widget.id);
                Navigator.pop(context);
              },
              label: const Text('Delete Marker'),
            ),
          ]),
        ],
      ),
    );
  }
}

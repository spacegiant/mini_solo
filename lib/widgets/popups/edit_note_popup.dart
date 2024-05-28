import 'package:flutter/cupertino.dart';
import '../../data/app_state.dart';
import '../../data/note_entry_item.dart';
import '../gap.dart';

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
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
  Widget build(BuildContext context) {
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
        const Text('Edit Note Entry'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            key: _key,
            controller: _controller,
            placeholder: 'Type here',
            autofocus: true,
            minLines: 9,
            maxLines: 9,
            textCapitalization: TextCapitalization.sentences,
          ),
        ),
        CupertinoButton(
            color: CupertinoColors.systemGreen,
            onPressed: () {
              widget.appState.updateNoteItem(currentEntryId, _controller.text);
              widget.appState.setCurrentEntryId('');
              widget.appState.closePopup();
            },
            child: const Text('Submit')),
        const Gap(),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteNoteItem(currentEntryId);
            widget.appState.closePopup();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}

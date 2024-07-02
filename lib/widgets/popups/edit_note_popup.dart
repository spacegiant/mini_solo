import 'package:flutter/cupertino.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import '../../data/app_state.dart';
import '../../data/note_entry_item.dart';
import '../gap.dart';

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
    NoteEntryItem entry = widget.appState.campaignData!.notes
        .firstWhere((entry) => entry.id == widget.id);

    if (_controller.text == '') {
      setState(() {
        _controller.text = entry.detail;
      });
    }

    return PopupLayout(
      header: const Text('Edit Note Entry'),
      body: CupertinoTextField(
        key: _key,
        controller: _controller,
        placeholder: 'Type here',
        autofocus: true,
        minLines: 9,
        maxLines: 9,
        textCapitalization: TextCapitalization.sentences,
      ),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
              color: CupertinoColors.systemGreen,
              onPressed: () {
                widget.appState.updateNoteItem(widget.id, _controller.text);
                // widget.appState.setCurrentEntryId('');
                // Navigator.pop(context);
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

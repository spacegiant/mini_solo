import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/grouping/group.dart';
import 'package:mini_solo/utilities/id_generator.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';
import '../../data/app_state.dart';

class AddGroupPopup extends StatefulWidget {
  const AddGroupPopup({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  State<AddGroupPopup> createState() => _AddGroupPopupState();
}

class _AddGroupPopupState extends State<AddGroupPopup> {
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
  Widget build(BuildContext context) {
    return PopupLayout(
        header: const PopupLayoutHeader(label: 'Add Group'),
        body: CupertinoTextField(
          controller: _controller,
        ),
        footer: CupertinoButton(
          color: CupertinoColors.systemPink,
          onPressed: () {
            String text = _controller.value.text.trim();
            if (text == '') return;
            widget.appState.createNewGroup(
              Group(groupId: genericId('group'), label: text, controlsIDs: []),
            );
            _controller.text = '';
          },
          child: const Text('Add'),
        ));
  }
}

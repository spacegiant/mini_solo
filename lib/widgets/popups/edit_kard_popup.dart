import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/app_state.dart';
import '../../features/grouping/group-picker.dart';
import '../gap.dart';

class EditKardPopup extends StatefulWidget {
  const EditKardPopup({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditKardPopup> createState() => _EditKardPopupState();
}

class _EditKardPopupState extends State<EditKardPopup> {
  late String selectedGroup;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedGroup = widget.appState.findCurrentGroupId(widget.id)!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(kPopupDeleteEntryLabel),
        Divider(),
        GroupPicker(
          onChange: (string) {
            setState(() {
              selectedGroup = string;
            });
          },
          appState: widget.appState,
          initialGroup: selectedGroup,
        ),
        const Gap(),
        CupertinoButton(
          color: kSubmitColor,
          onPressed: () {
            widget.appState
                .moveToGroup(controlId: widget.id, groupId: selectedGroup);
            Navigator.pop(context);
          },
          child: const Text('Update'),
        ),
        Gap(),
        CupertinoButton(
          color: CupertinoColors.destructiveRed,
          onPressed: () {
            widget.appState.deleteKard(widget.id);
            Navigator.pop(context);
          },
          child: const Text(kDeleteLabel),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

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
    return PopupLayout(
      header: const PopupLayoutHeader(label: 'Edit Card'),
      body: Column(children: [
        GroupPicker(
          onChange: (string) {
            setState(() {
              selectedGroup = string;
            });
          },
          appState: widget.appState,
          initialGroup: selectedGroup,
        ),
      ]),
      footer: Row(
        children: [
          CupertinoButton(
            color: kSubmitColor,
            onPressed: () {
              widget.appState
                  .moveToGroup(controlId: widget.id, groupId: selectedGroup);
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
          const Gap(),
          CupertinoButton(
            color: CupertinoColors.destructiveRed,
            onPressed: () {
              widget.appState.deleteKard(widget.id);
              Navigator.pop(context);
            },
            child: const Text(kDeleteLabel),
          ),
        ],
      ),
    );
    return Column(
      children: [
        const Text(kPopupDeleteEntryLabel),
        const Divider(),
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
        const Gap(),
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

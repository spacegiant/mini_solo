import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';

class EditGroupPopup extends StatefulWidget {
  final AppState appState;

  const EditGroupPopup({
    super.key,
    required this.appState,
    // required this.groupId,
  });

  @override
  State<EditGroupPopup> createState() => _EditGroupPopupState();
}

class _EditGroupPopupState extends State<EditGroupPopup> {
  List<String> controls = [];
  late Group currentGroup;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String groupId = widget.appState.currentEntryId;
    currentGroup = widget.appState.getGroup(groupId);
    controls = currentGroup.controls;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          child: Scaffold(
            body: ReorderableListView(
                children: controls
                    .map((control) =>
                        ListTile(title: Text(control), key: Key(control)))
                    .toList(),
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) newIndex -= 1;
                    final String itemToRemove = controls.removeAt(oldIndex);
                    controls.insert(newIndex, itemToRemove);
                  });
                }),
          ),
        ),
        CupertinoButton(
            child: Text('Update'),
            color: kSubmitColour,
            onPressed: () {
              widget.appState.updateGroupControls(
                  groupName: currentGroup.groupId, controls: controls);
            })
      ],
    );
  }
}

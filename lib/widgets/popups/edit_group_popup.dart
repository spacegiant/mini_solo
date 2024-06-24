import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';

class EditGroupPopup extends StatefulWidget {
  final AppState appState;
  final Group group;

  const EditGroupPopup({
    super.key,
    required this.appState,
    required this.group,
  });

  @override
  State<EditGroupPopup> createState() => _EditGroupPopupState();
}

class _EditGroupPopupState extends State<EditGroupPopup> {
  late List<String> controls;
  late Group currentGroup;

  @override
  void initState() {
    super.initState();
    controls = widget.group.controls;
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
                    .map((control) => ReorderableItem(
                          key: Key(control),
                          id: control,
                          appState: widget.appState,
                        ))
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

class ReorderableItem extends StatelessWidget {
  const ReorderableItem({
    super.key,
    required this.id,
    required this.appState,
  });

  final String id;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    String title;

    return ListTile(title: Text(id));
  }
}

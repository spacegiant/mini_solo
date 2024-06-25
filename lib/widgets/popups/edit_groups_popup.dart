import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import 'edit_group_popup.dart';

class EditGroupsPopup extends StatefulWidget {
  final AppState appState;

  const EditGroupsPopup({
    super.key,
    required this.appState,
  });

  @override
  State<EditGroupsPopup> createState() => _EditGroupsPopupState();
}

class _EditGroupsPopupState extends State<EditGroupsPopup> {
  late String selectedId;

  @override
  void initState() {
    super.initState();
    selectedId = '';
  }

  void handleTap(String id) {
    setState(() {
      selectedId = id;
    });
  }

  void handleOnReorder(int oldIndex, int newIndex, List<Group> groups) {
    setState(() {
      if (oldIndex < newIndex) newIndex -= 1;
      final Group itemToRemove = groups.removeAt(oldIndex);
      groups.insert(newIndex, itemToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Group> groups = widget.appState.groupList;

    return Column(
      children: [
        Container(
          height: 200.0,
          child: Scaffold(
            body: ReorderableListView(
              padding: const EdgeInsets.all(8.0),
              children: groups
                  .map((group) => ReorderableItem(
                        key: Key(group.groupId),
                        id: group.groupId,
                        appState: widget.appState,
                        label: group.label,
                        selected: selectedId == group.groupId,
                        onTap: () {
                          handleTap(group.groupId);
                        },
                      ))
                  .toList(),
              onReorder: (oldIndex, newIndex) {
                handleOnReorder(oldIndex, newIndex, groups);
              },
            ),
          ),
        ),
        CupertinoButton(
            child: Text('Update'),
            color: kSubmitColour,
            onPressed: () {
              // widget.appState.updateGroupControls(
              //   groupName: '',
              //   controls: controls,
              // );
              Navigator.pop(context);
            })
      ],
    );
  }
}

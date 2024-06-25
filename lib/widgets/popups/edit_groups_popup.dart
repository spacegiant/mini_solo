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

  void handleOnReorder(int oldIndex, int newIndex, List<dynamic> groups) {
    setState(() {
      if (oldIndex < newIndex) newIndex -= 1;
      final Group itemToRemove = groups.removeAt(oldIndex);
      groups.insert(newIndex, itemToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Group> groups = widget.appState.groupList;

    List<Widget> children = groups
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
        .toList();

    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 600.0,
            minHeight: 200.0,
          ),
          child: Scaffold(
            body: MyReorderableListView(
              itemList: groups,
              appState: widget.appState,
              selectedId: selectedId,
              onReorder: handleOnReorder,
              children: children,
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

class MyReorderableListView extends StatelessWidget {
  const MyReorderableListView({
    super.key,
    required this.itemList,
    required this.appState,
    required this.selectedId,
    required this.onReorder,
    required this.children,
  });

  final List<dynamic> itemList;
  final AppState appState;
  final String selectedId;
  final void Function(int, int, List<dynamic>) onReorder;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.all(8.0),
      children: children,
      onReorder: (oldIndex, newIndex) {
        onReorder(oldIndex, newIndex, itemList);
      },
    );
  }
}

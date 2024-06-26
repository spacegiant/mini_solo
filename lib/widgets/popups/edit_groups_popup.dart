import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import '../my_reorderable_item.dart';
import '../my_reorderable_list_view.dart';

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
        .mapIndexed((index, group) => MyReorderableItem(
              key: Key(group.groupId),
              id: group.groupId,
              appState: widget.appState,
              label: group.label,
              selected: selectedId == group.groupId,
              onTap: () {
                handleTap(group.groupId);
              },
              index: index,
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
            color: kSubmitColor,
            onPressed: () {
              widget.appState.updateGroups(groups: groups);
              // Navigator.pop(context);
            },
            child: const Text('Update'))
      ],
    );
  }
}

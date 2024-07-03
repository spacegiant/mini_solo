import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

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
  late List<Group> groups;

  @override
  void initState() {
    super.initState();
    selectedId = '';
    groups = widget.appState.groupList;
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
    // List<Group> groups = widget.appState.groupList;

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
              handleToggleActive: (bool checked) {
                widget.appState.getGroup(group.groupId).isActive = checked;
                widget.appState.saveCampaignDataToDisk();
              },
              itemIsActive: group.isActive,
              index: index,
            ))
        .toList();

    return PopupLayout(
      header: const PopupLayoutHeader(label: 'Edit Groups'),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 550.0,
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
        ],
      ),
      footer: CupertinoButton(
        color: kSubmitColor,
        onPressed: () {
          widget.appState.updateGroups(groups: groups);
          Navigator.pop(context);
        },
        child: const Text('Update'),
      ),
    );
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import '../../widgets/gap.dart';
import '../../widgets/my_reorderable_item.dart';
import '../../widgets/my_reorderable_list_view.dart';

class EditRandomTablesPopup extends StatefulWidget {
  final AppState appState;

  const EditRandomTablesPopup({
    super.key,
    required this.appState,
  });

  @override
  State<EditRandomTablesPopup> createState() => _EditRandomTablesPopupState();
}

class _EditRandomTablesPopupState extends State<EditRandomTablesPopup> {
  late String selectedId;
  late List<RandomTableEntry> randomTables;

  @override
  void initState() {
    super.initState();
    selectedId = '';
    randomTables = widget.appState.randomTables;
  }

  void handleTap(String id) {
    setState(() {
      selectedId = id;
    });
  }

  void handleOnReorder(int oldIndex, int newIndex, List<dynamic> groups) {
    setState(() {
      if (oldIndex < newIndex) newIndex -= 1;
      final RandomTableEntry itemToRemove = randomTables.removeAt(oldIndex);
      groups.insert(newIndex, itemToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<Group> groups = widget.appState.groupList;

    List<Widget> children = randomTables
        .mapIndexed((index, randomTable) => MyReorderableItem(
              key: Key(randomTable.id),
              id: randomTable.id,
              appState: widget.appState,
              label: randomTable.title,
              selected: selectedId == randomTable.id,
              onTap: () {
                handleTap(randomTable.id);
              },
              handleToggleActive: (bool isChecked) {
                widget.appState.getRandomTableById(randomTable.id).isHidden =
                    !isChecked;
                widget.appState.saveCampaignDataToDisk();
              },
              itemIsActive:
                  !widget.appState.getRandomTableById(randomTable.id).isHidden,
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
              itemList: randomTables,
              appState: widget.appState,
              selectedId: selectedId,
              onReorder: handleOnReorder,
              children: children,
            ),
          ),
        ),
        const Gap(),
        CupertinoButton(
            color: kSubmitColor,
            onPressed: () {
              // widget.appState.updateRandomTables(groups: randomTables);
              Navigator.pop(context);
            },
            child: const Text('Update'))
      ],
    );
  }
}

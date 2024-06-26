import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import '../../views/journal/control_data.dart';
import '../gap.dart';
import '../my_reorderable_item.dart';
import '../my_reorderable_list_view.dart';

class EditGroupPopup extends StatefulWidget {
  final AppState appState;
  final Group group;
  final List<ControlData> controlData;

  const EditGroupPopup({
    super.key,
    required this.appState,
    required this.group,
    required this.controlData,
  });

  @override
  State<EditGroupPopup> createState() => _EditGroupPopupState();
}

class _EditGroupPopupState extends State<EditGroupPopup> {
  late List<String> controls;
  late String selectedId;

  @override
  void initState() {
    super.initState();
    controls = widget.group.controls;
    selectedId = '';
  }

  void handleTap(String id) {
    setState(() {
      selectedId = id;
    });
  }

  void handleOnReorder(int oldIndex, int newIndex, List<dynamic> controls) {
    setState(() {
      if (oldIndex < newIndex) newIndex -= 1;
      final String itemToRemove = controls.removeAt(oldIndex);
      controls.insert(newIndex, itemToRemove);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = controls
        .mapIndexed((index, control) => MyReorderableItem(
              key: Key(control),
              id: control,
              appState: widget.appState,
              label: widget.controlData
                  .firstWhere((controlData) => controlData.controlId == control)
                  .label,
              selected: selectedId == control,
              onTap: () {
                handleTap(control);
              },
              index: index,
            ))
        .toList();

    return Flexible(
      child: Column(
        children: [
          ConstrainedBox(
            // height: 300.0,
            constraints: const BoxConstraints(
              maxHeight: 650.0,
              minHeight: 200.0,
            ),
            child: Scaffold(
                body: MyReorderableListView(
              itemList: controls,
              appState: widget.appState,
              selectedId: selectedId,
              onReorder: handleOnReorder,
              children: children,
            )),
          ),
          const Gap(),
          CupertinoButton(
              color: kSubmitColor,
              onPressed: () {
                widget.appState.updateGroupControls(
                  groupName: widget.group.groupId,
                  controls: controls,
                );
                Navigator.pop(context);
              },
              child: const Text('Update'))
        ],
      ),
    );
  }
}

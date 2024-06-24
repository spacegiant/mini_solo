import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';

import '../../data/app_state.dart';
import '../../features/grouping/group.dart';
import '../../views/journal/journal_controls.dart';

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
                          label: widget.controlData
                              .firstWhere((controlData) =>
                                  controlData.controlId == control)
                              .label,
                          selected: selectedId == control,
                          onTap: () {
                            setState(() {
                              selectedId = control;
                            });
                          },
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
                groupName: widget.group.groupId,
                controls: controls,
              );
              Navigator.pop(context);
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
    required this.label,
    this.selected,
    this.onTap,
  });

  final String id;
  final String label;
  final AppState appState;
  final bool? selected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String title;

    return ListTile(
      title: Text(label),
      selected: selected ?? false,
      onTap: onTap,
      tileColor: CupertinoColors.systemGrey5,
      selectedColor: CupertinoColors.black,
      selectedTileColor: CupertinoColors.systemYellow,
    );
  }
}

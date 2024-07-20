import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/label_and_input.dart';
import 'package:mini_solo/widgets/popups/popup_layout.dart';
import 'package:mini_solo/widgets/popups/popup_layout_header.dart';

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
  late bool isWrapped;
  late TextEditingController groupLabel;

  @override
  void initState() {
    super.initState();
    controls = widget.group.controlsIDs;
    selectedId = '';
    isWrapped = widget.group.isWrapped ?? false;
    groupLabel = TextEditingController(text: widget.group.label);
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
    List<Widget> children = [];

    for (final (index, control) in controls.indexed) {
      ControlData? controlData = widget.controlData
          .firstWhereOrNull((controlData) => controlData.controlId == control);

      if (controlData != null) {
        MyReorderableItem reorderableItem = MyReorderableItem(
          key: Key(control),
          id: control,
          appState: widget.appState,
          // TODO make this better
          label: controlData.label == '' ? '<unlabelled>' : controlData.label,
          selected: selectedId == control,
          onTap: () {
            handleTap(control);
          },
          index: index,
        );

        children.add(reorderableItem);
      }
    }

    Widget body() {
      return Column(
        children: [
          LabelAndInput(
              label: 'Group Name',
              controller: groupLabel,
              onChanged: (value) {
                setState(() {
                  groupLabel.text = value;
                });
              }),
          const Gap(),
          Scaffold(
              body: MyReorderableListView(
            itemList: controls,
            appState: widget.appState,
            selectedId: selectedId,
            onReorder: handleOnReorder,
            children: children,
          )),
          const Gap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CupertinoSwitch(
                      value: isWrapped,
                      onChanged: (value) {
                        setState(() {
                          isWrapped = !isWrapped;
                        });
                      }),
                  const Text('Wrap controls'),
                ],
              ),
            ],
          ),
        ],
      );
    }

    return PopupLayout(
      header: const PopupLayoutHeader(label: 'Edit Group'),
      body: body(),
      footer: CupertinoButton(
        color: kSubmitColor,
        onPressed: () {
          widget.appState.updateGroup(
            groupID: widget.group.groupId,
            controls: controls,
            isWrapped: isWrapped,
            label: groupLabel.value.text,
          );
          Navigator.pop(context);
        },
        child: const Text('Update'),
      ),
    );
  }
}

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/widgets/label_and_input.dart';
import 'package:mini_solo/widgets/label_and_picker.dart';
import 'package:mini_solo/widgets/my_reorderable_item.dart';

import '../../data/app_state.dart';
import '../../widgets/gap.dart';
import '../../widgets/label_and_switch.dart';
import '../../widgets/my_reorderable_list_view.dart';
import '../../widgets/popups/popup_layout.dart';
import '../../widgets/popups/popup_layout_header.dart';
import '../../widgets/toggle_active_block.dart';

enum ActionEditorType { label, randomTable, actionList }

Map<ActionEditorType, IconData> typeIcons = {
  ActionEditorType.label: CupertinoIcons.add,
  ActionEditorType.randomTable: CupertinoIcons.alarm,
  ActionEditorType.actionList: CupertinoIcons.ant,
};

class AddActionListPopup extends StatefulWidget {
  const AddActionListPopup({
    super.key,
    required this.appState,
    this.id,
  });

  final AppState appState;
  final String? id;

  @override
  State<AddActionListPopup> createState() => _AddActionListPopupState();
}

class _AddActionListPopupState extends State<AddActionListPopup> {
  late TextEditingController _labelController;
  late TextEditingController _actionLabelController;
  late String? selectedId;
  ActionEditorType? actionEditorType;
  int? pickerIndex;
  late String entryTitle;
  late bool entryIsActive;
  List<ActionRow> entryListOfActions = [];
  String? randomTableEntryId;
  String? actionTableEntryId;

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController(text: '');
    _actionLabelController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _labelController.dispose();
    _actionLabelController.dispose();
  }

  Widget addLabelForm() {
    return Flexible(
      child: LabelAndInput(
        axis: Axis.horizontal,
        label: 'Label',
        controller: _actionLabelController,
        onChanged: (value) {
          setState(() {
            _actionLabelController.text = value;
          });
        },
      ),
    );
  }

  Widget addRandomTableLink(List<RandomTableEntry> randomTables) {
    List<String> pickerOptions = [];

    for (RandomTableEntry tableEntry in randomTables) {
      pickerOptions.add(tableEntry.title);
    }

    if (pickerOptions.isEmpty) {
      return const Text('No Random Tables');
    } else if (pickerOptions.length == 1) {
      return Text('Random Table: ${pickerOptions[0]}');
    } else {
      return Flexible(
        child: LabelAndPicker(
            enabled: true,
            label: 'Random Table',
            items: pickerOptions,
            onChange: (value) {
              setState(() {
                if (value != null) randomTableEntryId = randomTables[value].id;
                pickerIndex = value;
              });
            },
            selectedIndex: pickerIndex),
      );
    }
  }

  Widget addActionListLink(List<ActionListEntry> actionEntries) {
    List<String> pickerOptions = [];

    for (ActionListEntry actionListEntry in actionEntries) {
      pickerOptions.add(actionListEntry.title);
    }

    if (pickerOptions.isEmpty) {
      return const Text('No Action Lists');
    } else if (pickerOptions.length == 1) {
      return Text('Action Table: ${pickerOptions[0]}');
    } else {
      return Flexible(
        child: LabelAndPicker(
            enabled: true,
            label: 'Action',
            items: pickerOptions,
            onChange: (value) {
              setState(() {
                if (value != null) actionTableEntryId = actionEntries[value].id;
                pickerIndex = value;
              });
            },
            selectedIndex: pickerIndex),
      );
    }
  }

  void handleSubmit() {
    widget.appState.addActionListsEntry(
      ActionListEntry(
          title: _labelController.value.text,
          list: entryListOfActions,
          isActive: true,
          isHidden: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<RandomTableEntry> randomTables = widget.appState.randomTables;
    List<ActionListEntry> actionListEntries =
        widget.appState.appSettingsData.actionLists;

    entryTitle = '';
    entryIsActive = true;
    bool canSubmit() {
      bool hasTitle = _labelController.value.text != '';
      bool actionListHasItems = entryListOfActions.isNotEmpty;
      return hasTitle && actionListHasItems;
    }

    bool canAddNewAction = randomTableEntryId != null ||
        _actionLabelController.value.text.trim() != '';

    return PopupLayout(
        header: const PopupLayoutHeader(
          label: 'Add Action List',
          icon: CupertinoIcons.sparkles,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LabelAndInput(
                autoFocus: true,
                label: 'Action List Label',
                controller: _labelController,
                onChanged: (value) {
                  setState(() {
                    _labelController.text = value;
                    entryTitle = value;
                  });
                }),
            const Gap(),
            LabelAndSwitch(
              label: 'Active?',
              onChanged: (value) {
                setState(() {
                  entryIsActive = !entryIsActive;
                });
              },
              switchValue: entryIsActive,
            ),
            const Divider(),
            const Gap(),
            const Text('Actions List'),
            const Gap(height: 6.0),
            Container(
                height: 200.0,
                color: CupertinoColors.white,
                child: entryListOfActions.isEmpty
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Add an Action'),
                          Gap(),
                          Icon(CupertinoIcons.down_arrow),
                        ],
                      )
                    : MyReorderableListView(
                        itemList: entryListOfActions,
                        appState: widget.appState,
                        selectedId: '',
                        onReorder: (oldIndex, newIndex, list) {},
                        children: entryListOfActions
                            .mapIndexed((index, entry) => MyReorderableItem(
                                  icon: typeIcons[entry.type],
                                  key: Key('action-$index'),
                                  id: 'action-$index',
                                  appState: widget.appState,
                                  label: handleString(
                                    widget.appState,
                                    entry.string,
                                    entry.type,
                                  ),
                                  index: index,
                                  handleToggleActive: (value) {},
                                ))
                            .toList(),
                      )),
            Row(
              children: [
                const Text('Add: '),
                CupertinoButton(
                    child: const Text('Label'),
                    onPressed: () {
                      setState(() {
                        actionEditorType = ActionEditorType.label;
                      });
                    }),
                CupertinoButton(
                    child: const Text('Random Table'),
                    onPressed: () {
                      setState(() {
                        randomTableEntryId = randomTables[0].id;
                        actionEditorType = ActionEditorType.randomTable;
                        _actionLabelController.text = '';
                      });
                    }),
                CupertinoButton(
                    child: const Text('Action'),
                    onPressed: () {
                      setState(() {
                        if (actionListEntries.isNotEmpty) {
                          actionTableEntryId = actionListEntries[0].id;
                        }
                        actionEditorType = ActionEditorType.actionList;
                        _actionLabelController.text = '';
                      });
                    }),
              ],
            ),
            const Divider(),
            ToggleActiveBlock(
              isActive: actionEditorType != null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (actionEditorType == ActionEditorType.randomTable)
                    addRandomTableLink(randomTables),
                  if (actionEditorType == ActionEditorType.label)
                    addLabelForm(),
                  if (actionEditorType == ActionEditorType.actionList)
                    addActionListLink(actionListEntries),
                  const Gap(),
                  ToggleActiveBlock(
                    isActive: canAddNewAction,
                    child: submitActionListButton(),
                  )
                ],
              ),
            )
          ],
        ),
        footer: CupertinoButton(
          color: kSubmitColor,
          onPressed: canSubmit() ? handleSubmit : null,
          child: const Text('Add'),
        ));
  }

  CupertinoButton submitActionListButton() {
    return CupertinoButton(
      minSize: 44.0,
      padding: EdgeInsets.zero,
      color: kSubmitColor,
      child: const Icon(CupertinoIcons.add),
      onPressed: () {
        ActionEditorType type = ActionEditorType.label;
        String string = '';

        if (_actionLabelController.value.text != '') {
          string = _actionLabelController.value.text;
          type = ActionEditorType.label;
        } else if (actionEditorType! == ActionEditorType.randomTable &&
            randomTableEntryId != null &&
            randomTableEntryId != '') {
          if (randomTableEntryId != null) string = randomTableEntryId!;
          type = ActionEditorType.randomTable;
        } else if (actionEditorType! == ActionEditorType.actionList &&
            actionTableEntryId != null &&
            actionTableEntryId != '') {
          if (actionTableEntryId != null) string = actionTableEntryId!;
          type = ActionEditorType.actionList;
        }

        if (string == '') return;

        setState(() {
          entryListOfActions.add(ActionRow(
            type: type,
            string: string,
          ));
          // CLEAR ALL
          _actionLabelController.text = '';
          actionEditorType = ActionEditorType.label;
        });
      },
    );
  }

  handleString(AppState appState, String string, ActionEditorType type) {
    if (type == ActionEditorType.randomTable) {
      return appState.randomTables
          .firstWhere((table) => table.id == string)
          .title;
    } else if (type == ActionEditorType.actionList) {
      return string;
    } else {
      return string;
    }
  }
}

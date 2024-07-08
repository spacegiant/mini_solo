import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/features/grouping/group-picker.dart';
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
  String? selectedId;
  ActionRow? currentEntry;
  ActionEditorType? actionEditorType;
  int? pickerIndex;
  late String entryTitle;
  late bool entryIsActive;
  List<ActionRow> entryListOfActions = [];
  String? randomTableEntryId;
  String? actionTableEntryId;
  ActionListEntry? entry;
  String selectedGroup = 'group-action-lists';
  late String? initialGroup;

  @override
  void initState() {
    super.initState();
    entry = widget.appState.actionLists
        .firstWhereOrNull((entry) => entry.id == widget.id);
    _labelController =
        TextEditingController(text: entry != null ? entry?.title : '');
    if (entry != null) entryListOfActions = entry!.list;
    _actionLabelController = TextEditingController(text: '');
    // TODO fix this
    initialGroup = widget.id.runtimeType == null
        ? 'unsorted'
        : widget.appState.findCurrentGroupId(widget.id!);
    selectedGroup = initialGroup!;
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

    List<ActionListEntry> safeList = List.from(actionEntries);
    safeList.removeWhere((entry) => entry.id == widget.id);

    for (ActionListEntry actionListEntry in safeList) {
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
    ActionListEntry actionListEntry = ActionListEntry(
        title: _labelController.value.text,
        list: entryListOfActions,
        isActive: true,
        isHidden: false);

    if (entry == null) {
      widget.appState.addActionList(actionListEntry);
    } else {
      widget.appState.updateActionList(id: entry!.id, entry: actionListEntry);
      widget.appState.removeFromAllGroups(controlId: entry!.id);
      widget.appState.addToGroup(controlId: entry!.id, groupId: selectedGroup);
    }

    widget.appState.saveAppSettingsDataToDisk();
    widget.appState.saveCampaignDataToDisk();
  }

  void handleItemSelected(String id) {
    setState(() {
      selectedId = id;
    });
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
                    ? ToggleActiveBlock(
                        isActive: _labelController.value.text != '',
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add an Action'),
                            Gap(),
                            Icon(CupertinoIcons.down_arrow),
                          ],
                        ),
                      )
                    : MyReorderableListView(
                        itemList: entryListOfActions,
                        appState: widget.appState,
                        selectedId: selectedId,
                        onReorder: (oldIndex, newIndex, list) {},
                        children: entryListOfActions.mapIndexed((index, entry) {
                          String itemIndex = 'action-$index';
                          return MyReorderableItem(
                            icon: typeIcons[entry.type],
                            key: Key(itemIndex),
                            id: itemIndex,
                            selected: selectedId == itemIndex,
                            appState: widget.appState,
                            label: processStringDependingOnType(
                              widget.appState,
                              entry.string,
                              entry.type,
                            ),
                            index: index,
                            onTap: () {
                              setState(() {
                                selectedId = itemIndex;
                                currentEntry = entry;
                                actionEditorType = entry.type;
                                _actionLabelController.text = entry.string;
                              });
                            },
                            onToggleActive: (value) {
                              // TODO toggle the activeId in State
                            },
                          );
                        }).toList(),
                      )),
            ToggleActiveBlock(
              isActive: _labelController.value.text != '',
              child: Row(
                children: [
                  const Text('Add: '),
                  CupertinoButton(
                      child: TextWithIndicator(
                        text: 'Label',
                        selected: actionEditorType == ActionEditorType.label,
                        // TODO this will clear the current item being edited
                      ),
                      onPressed: () {
                        currentEntry = null;
                        _actionLabelController.text = '';
                        setState(() {
                          actionEditorType = ActionEditorType.label;
                        });
                      }),
                  CupertinoButton(
                      child: TextWithIndicator(
                        text: 'RandomTable',
                        selected:
                            actionEditorType == ActionEditorType.randomTable,
                      ),
                      onPressed: () {
                        setState(() {
                          currentEntry = null;
                          if (randomTables.isNotEmpty) {
                            randomTableEntryId = randomTables[0].id;
                          }
                          actionEditorType = ActionEditorType.randomTable;
                          _actionLabelController.text = '';
                        });
                      }),
                  CupertinoButton(
                      child: TextWithIndicator(
                        text: 'Action',
                        selected:
                            actionEditorType == ActionEditorType.actionList,
                      ),
                      onPressed: () {
                        setState(() {
                          currentEntry = null;
                          if (actionListEntries.isNotEmpty) {
                            actionTableEntryId = actionListEntries[0].id;
                          }
                          actionEditorType = ActionEditorType.actionList;
                          _actionLabelController.text = '';
                        });
                      }),
                ],
              ),
            ),
            const Divider(),
            ToggleActiveBlock(
              isActive: actionEditorType != null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (actionEditorType == ActionEditorType.randomTable)
                    addRandomTableLink(randomTables)
                  else if (actionEditorType == ActionEditorType.actionList)
                    addActionListLink(actionListEntries)
                  else
                    addLabelForm(),
                  const Gap(),
                  ToggleActiveBlock(
                    isActive: canAddNewAction,
                    child: submitActionListButton(),
                  )
                ],
              ),
            ),
            const Divider(),
            GroupPicker(
              onChange: (idString) {
                setState(() {
                  selectedGroup = idString;
                });
              },
              appState: widget.appState,
              initialGroup: initialGroup,
            ),
          ],
        ),
        footer: Row(
          children: [
            CupertinoButton(
              color: kSubmitColor,
              onPressed: canSubmit() ? handleSubmit : null,
              child: Text(entry == null ? 'Add' : 'Update'),
            ),
            if (entry != null) ...[
              const Gap(),
              CupertinoButton(
                color: kWarningColor,
                onPressed: () {
                  widget.appState.deleteActionList(entry!.id);
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ]
          ],
        ));
  }

  CupertinoButton submitActionListButton() {
    return CupertinoButton(
      minSize: 44.0,
      padding: EdgeInsets.zero,
      color: kSubmitColor,
      child: Icon(currentEntry == null
          ? CupertinoIcons.add
          : CupertinoIcons.check_mark),
      onPressed: () {
        ActionEditorType type = ActionEditorType.label;
        String string = '';

        bool actionListLabelIsNotBlank =
            _actionLabelController.value.text != '';
        bool isRandomTable =
            actionEditorType! == ActionEditorType.randomTable &&
                randomTableEntryId != null &&
                randomTableEntryId != '';
        bool isActionList = actionEditorType! == ActionEditorType.actionList &&
            actionTableEntryId != null &&
            actionTableEntryId != '';

        if (actionListLabelIsNotBlank) {
          string = _actionLabelController.value.text;
          type = ActionEditorType.label;
        } else if (isRandomTable) {
          if (randomTableEntryId != null) string = randomTableEntryId!;
          type = ActionEditorType.randomTable;
        } else if (isActionList) {
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

  processStringDependingOnType(
      AppState appState, String string, ActionEditorType type) {
    if (type == ActionEditorType.randomTable) {
      return appState.randomTables
          .firstWhere((entry) => entry.id == string)
          .title;
    } else if (type == ActionEditorType.actionList) {
      return appState.actionLists
          .firstWhere((entry) => entry.id == string)
          .title;
    } else {
      return string;
    }
  }
}

class TextWithIndicator extends StatelessWidget {
  const TextWithIndicator({
    super.key,
    required this.text,
    required this.selected,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: selected ? const BorderSide(width: 1.0) : BorderSide.none),
      ),
      child: Text(text),
    );
  }
}

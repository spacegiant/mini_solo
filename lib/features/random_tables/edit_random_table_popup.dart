import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/features/random_tables/random_table_item.dart';
import 'package:mini_solo/view_items.dart';
import 'package:mini_solo/widgets/label_and_switch.dart';
import 'package:mini_solo/widgets/toggle_active_block.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../widgets/label_and_input.dart';
import '../grouping/group-picker.dart';
import '../../widgets/gap.dart';
import '../../widgets/label_and_picker.dart';

class EditRandomTable extends StatefulWidget {
  const EditRandomTable({
    super.key,
    required this.appState,
    required this.id,
  });

  final AppState appState;
  final String id;

  @override
  State<EditRandomTable> createState() => _EditRandomTableState();
}

class _EditRandomTableState extends State<EditRandomTable> {
  String selectedGroup = 'unsorted';
  late String selectedId;
  int? currentRowIndex;
  late TextEditingController _titleController;
  late TextEditingController _entryWeightController;
  late TextEditingController _entryTextController;
  String? selectedLinkId;
  late bool isHidden;
  bool showLinkOptions = false;
  late RandomTable entry;
  // late RandomTable updatedEntry;
  late List<RandomTable> randomTables;
  late List<RandomTable> safeList;
  late String? initialGroup;
  late bool newShowLinkOption = false;
  late bool newIsHidden = false;
  // late List<RandomTableRow> rows;
  late bool newIsFavourite;
  late List<RandomTableRow> newRows = [];

  @override
  void initState() {
    super.initState();
    selectedId = '';
    _entryTextController = TextEditingController(text: '');
    _entryWeightController = TextEditingController(text: '');
    // TODO is entry needed if we are using updatedEntry?
    entry = widget.appState.getRandomTableById(widget.id)!;
    _titleController = TextEditingController(text: entry.title);
    newIsFavourite = entry.isFavourite!;
    newRows = entry.rows;
    newShowLinkOption = entry.showLinkOptions!;
    newIsHidden = entry.isHidden;

    // isHidden = entry.isHidden;
    // rows = entry.rows;
    showLinkOptions = entry.showLinkOptions ?? false;
    randomTables = widget.appState.appSettingsData.randomTables;
    safeList = List.from(randomTables);
    safeList.removeWhere((table) => table.id == widget.id);
    initialGroup = widget.appState.findCurrentGroupId(widget.id);
    selectedGroup = initialGroup!;
  }

  @override
  Widget build(BuildContext context) {
    // List<RandomTableRow> rows = entry.rows;
    int recordCount = newRows.length;

    // TODO Remove current random table from links list

    handleListViewWidgetOnTap({
      required String id,
      required List<RandomTableRow> rows,
      required int rowIndex,
    }) {
      setState(() {
        selectedId = id;
        currentRowIndex = rowIndex;
        _entryTextController.text = rows[rowIndex].label;
        _entryWeightController.text = rows[rowIndex].weight.toString();
      });
    }

    int? getOtherLinkIndex() {
      return currentRowIndex != null
          ? safeList.indexWhere(
              (entry) => entry.id == newRows[currentRowIndex!].otherRandomTable)
          : null;
    }

    return Column(
      children: [
        // TODO dedicated title widget for popups for standardisation
        Text(
          '${_titleController.text} ($recordCount entries)',
          overflow: TextOverflow.ellipsis,
        ),
        const Divider(),
        RandomTableEntries(
          recordCount: recordCount,
          rows: newRows,
          selectedId: selectedId,
          onTap: handleListViewWidgetOnTap,
          appState: widget.appState,
          showLinkOptions: showLinkOptions,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelAndSwitch(
              label: 'Show link options',
              onChanged: (value) {
                newShowLinkOption = value;
                setState(() {
                  showLinkOptions = value;
                });
              },
              switchValue: showLinkOptions,
            ),
            CupertinoButton(
              child: const Text('Add new entry'),
              onPressed: () {
                RandomTableRow newRow =
                    RandomTableRow(weight: 1, label: 'New Entry');
                setState(() {
                  newRows.add(newRow);

                  int lastIndex = newRows.length - 1;
                  selectedId = 'random-table-item-$lastIndex';

                  currentRowIndex = lastIndex;
                  _entryTextController.text = newRows[currentRowIndex!].label;
                  _entryWeightController.text =
                      newRows[currentRowIndex!].weight.toString();
                });
              },
            ),
          ],
        ),
        const Divider(),
        const Gap(),
        RandomTablesFormContainer(
          isActive: selectedId != '',
          children: [
            LabelAndInput(
              axis: Axis.horizontal,
              label: 'Weight',
              enabled: selectedId != '',
              controller: _entryWeightController,
              onChanged: (value) {
                setState(() {
                  _entryWeightController.text = value;
                });
                if (currentRowIndex != null) {
                  newRows[currentRowIndex!].weight = int.tryParse(value.trim());
                }
              },
            ),
            const Gap(height: 4.0),
            LabelAndInput(
              axis: Axis.horizontal,
              label: 'Text',
              enabled: selectedId != '',
              controller: _entryTextController,
              onChanged: (value) {
                setState(() {
                  _entryTextController.text = value;
                });
                if (currentRowIndex != null) {
                  newRows[currentRowIndex!].label = value.trim();
                }
              },
            ),
            const Gap(height: 4.0),
            ToggleActiveBlock(
              isActive: safeList.isNotEmpty && selectedId != '',
              child: Row(
                children: [
                  Flexible(
                    child: LabelAndPicker(
                      defunctLabel: safeList.isEmpty
                          ? 'No Other Random Tables'
                          : 'No Link',
                      items: safeList.map((table) => table.title).toList(),
                      onChange: (index) {
                        if (index != null) {
                          setState(() {
                            selectedLinkId = safeList[index].id;
                            if (currentRowIndex != null) {
                              newRows[currentRowIndex!].otherRandomTable =
                                  safeList[index].id;
                            }
                          });
                        } else {
                          print('NULL');
                        }
                      },
                      label: 'Link',
                    ),
                  ),
                  CupertinoButton(
                      color: kWarningColor,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Text('Delete Entry'),
                      onPressed: () {
                        setState(() {
                          newRows.removeAt(currentRowIndex!);
                        });
                      })
                ],
              ),
            ),
          ],
        ),
        const Divider(),

        GroupPicker(
          onChange: (idString) {
            setState(() {
              selectedGroup = idString;
            });
          },
          appState: widget.appState,
          initialGroupId: initialGroup,
        ),
        LabelAndInput(
            label: 'Table Name',
            controller: _titleController,
            onChanged: (value) {
              setState(() {
                _titleController.text = value;
              });
            }),
        Row(
          children: [
            CupertinoSwitch(
                value: newIsHidden,
                onChanged: (value) {
                  newIsHidden = value;
                  widget.appState.saveAppSettingsDataToDisk();
                  setState(() {
                    isHidden = value;
                  });
                }),
            const Text('Hidden'),
          ],
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: [
            CupertinoButton(
                color: kSubmitColor,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text('Update Table'),
                onPressed: () {
                  widget.appState.updateRandomTable(
                    id: widget.id,
                    title: _titleController.text,
                    rows: newRows,
                    showLinkOptions: newShowLinkOption,
                    isFavourite: newIsFavourite,
                  );

                  if (initialGroup != selectedGroup) {
                    widget.appState.moveToGroup(
                        controlId: widget.id, groupId: selectedGroup);
                  }

                  Navigator.pop(context);
                }),
            CupertinoButton(
                color: kWarningColor,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text('Delete Table'),
                onPressed: () {
                  widget.appState.deleteRandomTable(widget.id);
                  Navigator.pop(context);
                }),
            // CupertinoButton(
            // TODO Implement Export to JSON
            //     color: CupertinoColors.systemGrey3,
            //     child: const Text('Export JSON to Clipboard'),
            //     onPressed: () {
            //       // TODO EXPORT
            //     }),
          ],
        ),
      ],
    );
  }
}

class RandomTableEntries extends StatelessWidget {
  const RandomTableEntries({
    super.key,
    required this.recordCount,
    required this.rows,
    required this.selectedId,
    required this.onTap,
    required this.appState,
    required this.showLinkOptions,
  });

  final int recordCount;
  final List<RandomTableRow> rows;
  final String selectedId;
  final Null Function({
    required String id,
    required List<RandomTableRow> rows,
    required int rowIndex,
  }) onTap;
  final AppState appState;
  final bool showLinkOptions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300.0,
        child: ListView.builder(
          itemCount: rows.length,
          prototypeItem: RandomTableItem(
            row: RandomTableRow(label: 'prototype label', weight: 100),
            onTap: (String id) {},
            id: 'prototypeId',
            selectedId: '',
            appState: appState,
            showLinkOptions: showLinkOptions,
          ),
          itemBuilder: (context, index) {
            return RandomTableItem(
              showLinkOptions: showLinkOptions,
              onTap: (id) {
                onTap(
                  id: id,
                  rows: rows,
                  rowIndex: index,
                );
              },
              row: rows[index],
              id: 'random-table-item-$index',
              selectedId: selectedId,
              appState: appState,
            );
          },
        ));
  }
}

class RandomTablesFormContainer extends StatelessWidget {
  const RandomTablesFormContainer({
    super.key,
    required this.children,
    this.isActive = true,
  });

  final List<Widget> children;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: Opacity(
        opacity: isActive! ? 1 : 0.5,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

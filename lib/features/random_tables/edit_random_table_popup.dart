import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/features/random_tables/random_table_item.dart';
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
  late TextEditingController _weightController;
  late TextEditingController _textController;
  String? selectedLinkId;
  late bool isRandomTable;
  late bool isHidden;
  late RandomTable entry;
  late RandomTable updatedEntry;
  late List<RandomTable> randomTables;
  late List<RandomTable> safeList;
  late String? initialGroup;

  @override
  void initState() {
    super.initState();
    selectedId = '';
    _textController = TextEditingController(text: '');
    _weightController = TextEditingController(text: '');
    // TODO is entry needed if we are using updatedEntry?
    entry = widget.appState.getRandomTableById(widget.id)!;
    updatedEntry = entry;
    isRandomTable = entry.isRandomTable;
    isHidden = entry.isHidden;
    randomTables = widget.appState.appSettingsData.randomTables;
    safeList = List.from(randomTables);
    safeList.removeWhere((table) => table.id == widget.id);
    initialGroup = widget.appState.findCurrentGroupId(widget.id);
    selectedGroup = initialGroup!;
  }

  @override
  Widget build(BuildContext context) {
    List<RandomTableRow> rows = entry.rows;
    int recordCount = rows.length;

    // TODO Remove current random table from links list

    handleListViewWidgetOnTap({
      required String id,
      required List<RandomTableRow> rows,
      required int rowIndex,
    }) {
      setState(() {
        selectedId = id;
        currentRowIndex = rowIndex;
        _textController.text = rows[rowIndex].label;
        _weightController.text = rows[rowIndex].weight.toString();
      });
    }

    int? getOtherLinkIndex() {
      return currentRowIndex != null
          ? safeList.indexWhere((entry) =>
              entry.id == updatedEntry.rows[currentRowIndex!].otherRandomTable)
          : null;
    }

    return Column(
      children: [
        // TODO dedicated title widget for popups for standardisation
        Text(
          '${entry.title} ($recordCount entries)',
          overflow: TextOverflow.ellipsis,
        ),
        const Divider(),
        RandomTableEntries(
          recordCount: recordCount,
          rows: rows,
          selectedId: selectedId,
          onTap: handleListViewWidgetOnTap,
          appState: widget.appState,
        ),
        LabelAndSwitch(
            label: 'Show link options',
            onChanged: (value) {},
            switchValue: true),
        const Divider(),
        const Gap(),
        RandomTablesFormContainer(
          isActive: selectedId != '',
          children: [
            LabelAndInput(
              axis: Axis.horizontal,
              label: 'Weight',
              enabled: selectedId != '',
              controller: _weightController,
              onChanged: (value) {
                setState(() {
                  _weightController.text = value;
                });
                if (currentRowIndex != null) {
                  updatedEntry.rows[currentRowIndex!].weight =
                      int.tryParse(value.trim());
                }
              },
            ),
            const Gap(height: 4.0),
            LabelAndInput(
              axis: Axis.horizontal,
              label: 'Text',
              enabled: selectedId != '',
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  _textController.text = value;
                });
                if (currentRowIndex != null) {
                  updatedEntry.rows[currentRowIndex!].label = value.trim();
                }
              },
            ),
            const Gap(height: 4.0),
            ToggleActiveBlock(
              isActive: safeList.isNotEmpty && selectedId != '',
              child: LabelAndPicker(
                defunctLabel:
                    safeList.isEmpty ? 'No Other Random Tables' : 'No Link',
                items: safeList.map((table) => table.title).toList(),
                onChange: (index) {
                  if (index != null) {
                    setState(() {
                      selectedLinkId = safeList[index].id;
                      if (currentRowIndex != null) {
                        updatedEntry.rows[currentRowIndex!].otherRandomTable =
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
        Row(
          children: [
            CupertinoSwitch(
                value: entry.isRandomTable,
                onChanged: (value) {
                  entry.isRandomTable = value;
                  widget.appState.saveAppSettingsDataToDisk();
                  setState(() {
                    isRandomTable = value;
                  });
                }),
            const Text('Is a random list'),
          ],
        ),
        Row(
          children: [
            CupertinoSwitch(
                value: entry.isHidden,
                onChanged: (value) {
                  entry.isHidden = value;
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
                  if (currentRowIndex != null) {
                    widget.appState.updateRandomTable(
                      id: widget.id,
                      entry: updatedEntry,
                    );
                  }

                  if (initialGroup != selectedGroup) {
                    widget.appState.moveToGroup(
                        controlId: widget.id, groupId: selectedGroup);
                  }

                  // widget.appState.saveCampaignDataToDisk();
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
          ),
          itemBuilder: (context, index) {
            return RandomTableItem(
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

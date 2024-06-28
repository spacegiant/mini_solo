import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/features/random_tables/random_table_item.dart';
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
  late RandomTableEntry entry;

  @override
  void initState() {
    super.initState();
    selectedId = '';
    _textController = TextEditingController(text: '');
    _weightController = TextEditingController(text: '');
    entry = widget.appState.getRandomTableById(widget.id);
    isRandomTable = entry.isRandomTable;
    isHidden = entry.isHidden;
  }

  @override
  Widget build(BuildContext context) {
    String? initialGroup = widget.appState.findCurrentGroupId(widget.id);
    List<RandomTableRow> rows = entry.rows;
    int recordCount = rows.length;
    List<RandomTableEntry> randomTables =
        widget.appState.appSettingsData.randomTables;

    // TODO Remove current random table from links list
    List<RandomTableEntry> safeList = List.from(randomTables);
    safeList.removeWhere((table) => table.id == widget.id);

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

    return Column(
      children: [
        // TODO dedicated title widget for popups for standardisation
        Text('${entry.title} ($recordCount entries)'),
        const Divider(),
        RandomTableEntries(
          recordCount: recordCount,
          rows: rows,
          selectedId: selectedId,
          onTap: handleListViewWidgetOnTap,
          appState: widget.appState,
        ),
        const Divider(),
        const Gap(),
        RandomTablesFormContainer(
          isActive: selectedId != '',
          children: [
            LabelAndInput(
              label: 'Weight',
              enabled: selectedId != '',
              controller: _weightController,
              onChanged: (value) {
                setState(() {
                  _weightController.text = value;
                });
              },
            ),
            const Gap(height: 4.0),
            LabelAndInput(
              label: 'Text',
              enabled: selectedId != '',
              controller: _textController,
              onChanged: (value) {
                setState(() {
                  _textController.text = value;
                });
              },
            ),
            const Gap(height: 4.0),
            LabelAndPicker(
              defunctLabel: 'No Link',
              enabled: selectedId != '',
              items: safeList.map((table) => table.title).toList(),
              onChange: (index) {
                if (index != null) {
                  setState(() {
                    selectedLinkId = safeList[index].id;
                  });
                } else {
                  print('NULL');
                }
              },
              label: 'Link',
            ),
          ],
        ),
        const Divider(),
        GroupPicker(
          onChange: (string) {
            setState(() {
              selectedGroup = string;
            });
          },
          appState: widget.appState,
          initialGroup: initialGroup,
        ),
        Row(
          children: [
            CupertinoSwitch(
                value: entry.isRandomTable,
                onChanged: (value) {
                  entry.isRandomTable = value;
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
                child: const Text('Update'),
                onPressed: () {
                  if (currentRowIndex == null) return;
                  if (initialGroup != selectedGroup) {
                    widget.appState.moveToGroup(
                        controlId: widget.id, groupId: selectedGroup);
                  }

                  String newLabel = _textController.value.text.trim();
                  int newWeight;

                  if (selectedLinkId != null) {
                    entry.rows[currentRowIndex!].otherRandomTable =
                        selectedLinkId;
                  } else {
                    entry.rows[currentRowIndex!].otherRandomTable = null;
                  }

                  if (newLabel != '') {
                    entry.rows[currentRowIndex!].label = newLabel;
                  }

                  try {
                    newWeight = int.parse(_weightController.value.text);
                    entry.rows[currentRowIndex!].weight = newWeight;
                  } catch (e) {
                    print(e);
                  }

                  // widget.appState.updateRandomTable(
                  //   id: widget.id,
                  //   entry: RandomTableEntry(
                  //     isFavourite: entry.isFavourite,
                  //     title: entry.title,
                  //     rows: entry.rows,
                  //   ),
                  // );
                  widget.appState.saveAppSettingsDataToDisk();
                  widget.appState.saveCampaignDataToDisk();
                  Navigator.pop(context);
                }),
            CupertinoButton(
                color: kWarningColor,
                child: const Text('Delete'),
                onPressed: () {
                  widget.appState.deleteRandomTable(widget.id);
                  Navigator.pop(context);
                }),
            CupertinoButton(
                color: CupertinoColors.systemGrey3,
                child: const Text('Export JSON to Clipboard'),
                onPressed: () {
                  // TODO EXPORT
                }),
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
          itemCount: recordCount,
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

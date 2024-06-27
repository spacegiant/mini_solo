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
  late TextEditingController _weightController;
  late TextEditingController _textController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedId = '';
    _textController = TextEditingController(text: '');
    _weightController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    RandomTableEntry entry = widget.appState.getRandomTableById(widget.id);
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
                print(safeList[index].title);
                // The index relates to the item in the dropdown
                // TODO what is the current row?
                // print(entry.rows[selectedId]);
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
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: [
            CupertinoButton(
                color: kSubmitColor,
                child: const Text('Update'),
                onPressed: () {
                  if (initialGroup != selectedGroup) {
                    widget.appState.moveToGroup(
                        controlId: widget.id, groupId: selectedGroup);
                  }
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
  });

  final int recordCount;
  final List<RandomTableRow> rows;
  final String selectedId;
  final Null Function({
    required String id,
    required List<RandomTableRow> rows,
    required int rowIndex,
  }) onTap;

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

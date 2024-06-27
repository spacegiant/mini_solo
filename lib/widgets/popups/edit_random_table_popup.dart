import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/widgets/picker.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../features/grouping/group-picker.dart';
import '../gap.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedId = '';
  }

  @override
  Widget build(BuildContext context) {
    RandomTableEntry entry = widget.appState.appSettingsData.randomTables
        .firstWhere((entry) => entry.id == widget.id);
    String? initialGroup = widget.appState.findCurrentGroupId(widget.id);

    String? detail = entry.title;

    List<RandomTableRow> rows = entry.rows;
    int recordCount = rows.length;

    List<RandomTableEntry> randomTables =
        widget.appState.appSettingsData.randomTables;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('$detail ($recordCount entries)'),
          const Divider(),
          SizedBox(
              height: 300.0,
              child: ListView.builder(
                itemCount: recordCount,
                prototypeItem: ListViewWidget(
                  row: RandomTableRow(label: 'prototype label', weight: 100),
                  onTap: (String id) {},
                  id: 'prototypeId',
                  selectedId: '',
                ),
                itemBuilder: (context, index) {
                  return ListViewWidget(
                    onTap: (id) {
                      setState(() {
                        selectedId = id;
                      });
                    },
                    row: rows[index],
                    id: 'random-table-item-$index',
                    selectedId: selectedId,
                  );
                },
              )),
          const Divider(),
          const Gap(),
          SizedBox(
              height: 120.0,
              child: Opacity(
                opacity: selectedId == '' ? 0.5 : 1,
                child: Column(
                  children: [
                    LabelAndInput(
                      label: 'Weight',
                      enabled: selectedId != '',
                    ),
                    const Gap(height: 4.0),
                    const LabelAndInput(
                      label: 'Text',
                    ),
                    const Gap(height: 4.0),
                    LabelAndPicker(
                      enabled: selectedId != '',
                      items: randomTables.map((table) => table.title).toList(),
                      onChange: (thing) {},
                      label: 'Link',
                    ),
                  ],
                ),
              )),
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
                    widget.appState.moveToGroup(
                        controlId: widget.id, groupId: selectedGroup);
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
                  child: const Text('Export'),
                  onPressed: () {
                    // TODO EXPORT
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class LabelAndInput extends StatelessWidget {
  const LabelAndInput({
    super.key,
    required this.label,
    this.enabled,
  });

  final String label;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        const Gap(),
        Flexible(
            child: CupertinoTextField(
          enabled: enabled ?? false,
        )),
      ],
    );
  }
}

class LabelAndPicker extends StatelessWidget {
  const LabelAndPicker({
    super.key,
    required this.label,
    this.enabled,
    required this.items,
    required this.onChange,
  });

  final String label;
  final bool? enabled;
  final List<String> items;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label),
        const Gap(),
        // TODO Change this to some sort of Filter List
        Flexible(
          child: Picker(
            items: items,
            onChange: onChange,
            enabled: enabled ?? false,
          ),
        ),
      ],
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.row,
    required this.onTap,
    required this.id,
    required this.selectedId,
  });

  final String id;
  final RandomTableRow row;
  final Function(String id) onTap;
  final String selectedId;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      backgroundColor: selectedId == id ? kSelectedRowColor : null,
      padding: EdgeInsets.zero,
      onTap: () {
        onTap(id);
      },
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(row.weight.toString()),
            const Text(' · '),
            Text(
              row.label,
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}

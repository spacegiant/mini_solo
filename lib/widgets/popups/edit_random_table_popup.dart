import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    RandomTableEntry entry = widget.appState.appSettingsData.randomTables
        .firstWhere((entry) => entry.id == widget.id);
    String? initialGroup = widget.appState.findCurrentGroupId(widget.id);

    String? detail = entry.title;

    List<RandomTableRow> rows = entry.rows;
    int recordCount = rows.length;

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
                prototypeItem: CupertinoListTile(title: Text(rows.first.label)),
                itemBuilder: (context, index) {
                  return ListViewWidget(
                    row: rows[index],
                  );
                },
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

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.row,
  });

  final RandomTableRow row;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      onTap: () {},
      title: Row(
        children: [
          Text(row.weight.toString()),
          const Gap(),
          Expanded(child: Text(row.label)),
          CupertinoButton(
              child: const Icon(CupertinoIcons.trash, size: 12.0),
              onPressed: () {})
        ],
      ),
    );
  }
}

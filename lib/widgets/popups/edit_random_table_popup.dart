import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../features/grouping/group-picker.dart';
import '../gap.dart';

class EditRandomTable extends StatefulWidget {
  final AppState appState;

  const EditRandomTable({
    super.key,
    required this.appState,
  });

  @override
  State<EditRandomTable> createState() => _EditRandomTableState();
}

class _EditRandomTableState extends State<EditRandomTable> {
  String selectedGroup = 'unsorted';

  @override
  Widget build(BuildContext context) {
    String currentEntryId = widget.appState.currentEntryId;
    RandomTableEntry entry = widget.appState.appSettingsData.randomTables
        .firstWhere((entry) => entry.id == currentEntryId);
    String initialGroup = widget.appState.findCurrentGroupId(currentEntryId);

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
                  color: kSubmitColour,
                  child: const Text('Update'),
                  onPressed: () {
                    widget.appState.moveToGroup(
                        controlId: currentEntryId, groupId: selectedGroup);
                    widget.appState.closePopup();
                  }),
              CupertinoButton(
                  color: kWarningColour,
                  child: const Text('Delete'),
                  onPressed: () {
                    widget.appState.deleteRandomTable(currentEntryId);
                    widget.appState.closePopup();
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

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onLongPress: () {
        // widget.appState.setCurrentEntryId(entry.id);
        widget.appState.toggleShowPopup(
          label: PopupLabel.editNote,
          id: entry.id,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(detail),
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

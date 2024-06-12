import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/constants.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../gap.dart';

class EditRandomTable extends StatelessWidget {
  final AppState appState;

  const EditRandomTable({
    super.key,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    String currentEntryId = appState.currentEntryId;
    RandomTableEntry entry = appState.appSettingsData.randomTables
        .firstWhere((entry) => entry.id == currentEntryId);

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
              height: 400.0,
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
          Row(
            children: [
              CupertinoButton(
                  color: kWarningColour,
                  child: const Text('Delete Table'),
                  onPressed: () {
                    appState.deleteRandomTable(currentEntryId);
                    appState.closePopup();
                  }),
              CupertinoButton(
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
        appState.setCurrentEntryId(entry.id);
        appState.toggleShowPopup(
          label: PopupLabel.editNote,
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

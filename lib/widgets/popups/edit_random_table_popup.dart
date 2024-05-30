import 'package:flutter/cupertino.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';

class EditRandomTable extends StatelessWidget {
  final AppState appState;

  const EditRandomTable({
    super.key,
    required this.appState,
  });

  @override
  Widget build(BuildContext context) {
    String currentEntryId = appState.currentEntryId;
    print(currentEntryId);
    RandomTableEntry entry = appState.appSettingsData.randomTables
        .firstWhere((entry) => entry.id == currentEntryId);

    String? detail = entry.title;

    List<RandomTableRow> rows = entry.rows;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(detail),
          SingleChildScrollView(
            child: Column(
              children: [
                ...rows.map(
                  (row) => Row(
                    children: [
                      Text(row.weight.toString()),
                      Expanded(child: Text(row.label)),
                      CupertinoButton(
                          child: const Text('Delete'), onPressed: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              CupertinoButton(
                  child: const Text('Delete Table'), onPressed: () {}),
              CupertinoButton(child: const Text('Export'), onPressed: () {}),
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

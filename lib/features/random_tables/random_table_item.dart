import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../widgets/gap.dart';

class RandomTableItem extends StatelessWidget {
  const RandomTableItem({
    super.key,
    required this.row,
    required this.onTap,
    required this.id,
    required this.selectedId,
    required this.appState,
  });

  final String id;
  final RandomTableRow row;
  final Function(String id) onTap;
  final String selectedId;
  final AppState appState;

  @override
  Widget build(BuildContext context) {
    String label;
    Icon? icon;

    if (row.otherRandomTable != null) {
      label = appState.appSettingsData.randomTables
          .firstWhere((table) => table.id == row.otherRandomTable)
          .title;
      icon = const Icon(
        CupertinoIcons.link,
        size: 16.0,
        color: CupertinoColors.black,
      );
    } else {
      label = row.label;
    }

    return CupertinoListTile(
      backgroundColor: selectedId == id ? kSelectedRowColor : null,
      padding: EdgeInsets.zero,
      onTap: () {
        onTap(id);
      },
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(row.weight.toString()),
            const Text(' · '),
            if (icon != null) ...[icon, const Gap()],
            Text(
              label,
              overflow: TextOverflow.clip,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}

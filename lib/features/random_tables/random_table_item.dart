
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
    String label = row.label;
    String linkedLabel = row.otherRandomTable == null
        ? 'Not Linked'
        : appState.appSettingsData.randomTables
            .firstWhere((table) => table.id == row.otherRandomTable)
            .title;
    Icon icon = const Icon(
      CupertinoIcons.link,
      size: 16.0,
      color: CupertinoColors.black,
    );

    return CupertinoListTile(
      backgroundColor: selectedId == id ? kSelectedRowColor : null,
      padding: EdgeInsets.zero,
      onTap: () {
        onTap(id);
      },
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(row.weight.toString()),
            const Text(' · '),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                    opacity: row.otherRandomTable != null ? 0.5 : 1.0,
                    child: SizedBox(
                      width: 330.0,
                      child: Text(
                        label,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
                Opacity(
                  opacity: row.otherRandomTable == null ? 0.5 : 1.0,
                  child: Row(
                    children: [
                      icon,
                      const Gap(),
                      // TODO deal with overflow here
                      SizedBox(
                        width: 310.0,
                        child: Text(
                          linkedLabel,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
            // if (icon != null) ...[icon, const Gap()],
            // ConstrainedBox(
            //   constraints: const BoxConstraints(maxWidth: 330.0),
            //   child: Text(
            //     label,
            //     overflow: TextOverflow.ellipsis,
            //     softWrap: false,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

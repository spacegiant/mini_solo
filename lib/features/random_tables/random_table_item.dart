import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../../data/app_settings_data.dart';

class RandomTableItem extends StatelessWidget {
  const RandomTableItem({
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

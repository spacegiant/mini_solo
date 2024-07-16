import 'package:flutter/cupertino.dart';

import '../../data/campaign_data.dart';
import '../../data/data_structures/scratch_page_entry_item.dart';

class ScratchPickerItem extends StatelessWidget {
  final ScratchPageEntryItem entry;
  final Function(String) onSelect;
  final Null Function(String id) onDelete;

  const ScratchPickerItem(
    this.entry, {
    super.key,
    required this.onSelect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoButton(
            alignment: Alignment.centerLeft,
            child: Text(entry.title),
            onPressed: () {
              onSelect(entry.id);
            },
          ),
        ),
        CupertinoButton(
          child: const Icon(CupertinoIcons.star),
          onPressed: () {},
        ),
        CupertinoButton(
          child: const Icon(CupertinoIcons.trash),
          onPressed: () {
            onDelete(entry.id);
          },
        ),
      ],
    );
  }
}

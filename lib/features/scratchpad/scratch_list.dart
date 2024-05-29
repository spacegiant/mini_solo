import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/scratchpad/scratch_list_item.dart';

import '../../data/campaign_data.dart';

class ScratchList extends StatelessWidget {
  final List<ScratchPageEntryItem> scratchItems;
  final Function(String) onSelect;
  final Null Function(String id) onDelete;

  const ScratchList({
    super.key,
    required this.scratchItems,
    required this.onSelect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    List<ScratchListItem> scratchListData = scratchItems
        .map(
          (entry) => ScratchListItem(
            entry,
            onSelect: onSelect,
            onDelete: onDelete,
          ),
        )
        .toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 10.0,
        maxHeight: 140.0,
      ),
      child: ListView(
        children: scratchListData,
      ),
    );
  }
}

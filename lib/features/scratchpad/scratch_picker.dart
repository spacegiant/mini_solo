import 'package:flutter/cupertino.dart';
import 'package:mini_solo/features/scratchpad/scratch_picker_item.dart';

import '../../data/campaign_data.dart';

class ScratchPicker extends StatelessWidget {
  final List<ScratchPageEntryItem> scratchItems;
  final Function(String) onSelect;
  final Null Function(String id) onDelete;

  const ScratchPicker({
    super.key,
    required this.scratchItems,
    required this.onSelect,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    List<ScratchPickerItem> scratchListData = scratchItems
        .map(
          (entry) => ScratchPickerItem(
            entry,
            onSelect: onSelect,
            onDelete: onDelete,
          ),
        )
        .toList();

    return Flexible(
      child: ListView(
        children: scratchListData,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/app_state.dart';

class MyReorderableItem extends StatelessWidget {
  const MyReorderableItem({
    super.key,
    required this.id,
    required this.appState,
    required this.label,
    this.selected,
    this.onTap,
    required this.index,
  });

  final String id;
  final String label;
  final AppState appState;
  final bool? selected;
  final Function()? onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ReorderableDelayedDragStartListener(
      index: index,
      child: ListTile(
        title: Text(label),
        trailing: const Icon(
          CupertinoIcons.line_horizontal_3,
          size: 20.0,
          color: CupertinoColors.systemGrey,
        ),
        selected: selected ?? false,
        onTap: onTap,
        // tileColor: CupertinoColors.systemGrey5,
        // selectedColor: CupertinoColors.black,
        selectedTileColor: CupertinoColors.systemYellow,
      ),
    );
  }
}

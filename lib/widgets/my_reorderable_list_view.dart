import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/app_state.dart';

class MyReorderableListView extends StatelessWidget {
  const MyReorderableListView({
    super.key,
    required this.itemList,
    required this.appState,
    required this.selectedId,
    required this.onReorder,
    required this.children,
  });

  final List<dynamic> itemList;
  final AppState appState;
  final String selectedId;
  final void Function(int, int, List<dynamic>) onReorder;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.all(8.0),
      children: children,
      onReorder: (oldIndex, newIndex) {
        onReorder(oldIndex, newIndex, itemList);
      },
    );
  }
}

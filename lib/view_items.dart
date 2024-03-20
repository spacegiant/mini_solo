import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/dice_view.dart';
import 'package:mini_solo/views/journal_view.dart';
import 'package:mini_solo/views/lists_view.dart';
import 'package:mini_solo/views/new_view.dart';
import 'package:mini_solo/views/starred_view.dart';
import 'package:mini_solo/views/tracker_view.dart';

class ViewItem {
  String label;
  IconData icon;
  Widget viewWidget;

  ViewItem({
    required this.label,
    required this.icon,
    required this.viewWidget,
  });
}

List<ViewItem> viewItems = [
  ViewItem(
    label: 'Journal',
    icon: CupertinoIcons.book,
    viewWidget: const JournalView(),
  ),
  ViewItem(
    label: 'New',
    icon: CupertinoIcons.add,
    viewWidget: const NewView(),
  ),
  ViewItem(
    label: 'Starred',
    icon: CupertinoIcons.star,
    viewWidget: const StarredView(),
  ),
  ViewItem(
    label: 'Trackers',
    icon: CupertinoIcons.check_mark_circled,
    viewWidget: const TrackerView(),
  ),
  ViewItem(
    label: 'Lists',
    icon: CupertinoIcons.pencil,
    viewWidget: const ListsView(),
  ),
  ViewItem(
    label: 'Dice',
    icon: CupertinoIcons.cube,
    viewWidget: const DiceView(),
  )
];

import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/dice_view.dart';
import 'package:mini_solo/views/journal_view.dart';
import 'package:mini_solo/views/lists_view.dart';
import 'package:mini_solo/views/new_view.dart';
import 'package:mini_solo/views/starred_view.dart';
import 'package:mini_solo/views/tracker_view.dart';

class TabBarItem {
  String label;
  IconData icon;
  Widget viewWidget;
  bool? hide;

  TabBarItem({
    required this.label,
    required this.icon,
    required this.viewWidget,
    this.hide,
  });
}

List<TabBarItem> tabBarItems = [
  TabBarItem(
    label: 'Journal',
    icon: CupertinoIcons.book,
    viewWidget: const JournalView(),
  ),
  TabBarItem(
    label: 'New',
    icon: CupertinoIcons.add,
    viewWidget: const NewView(),
  ),
  TabBarItem(
    label: 'Starred',
    icon: CupertinoIcons.star,
    viewWidget: const StarredView(),
    hide: true,
  ),
  TabBarItem(
    label: 'Trackers',
    icon: CupertinoIcons.check_mark_circled,
    viewWidget: const TrackerView(),
  ),
  TabBarItem(
    label: 'Lists',
    icon: CupertinoIcons.pencil,
    viewWidget: const ListsView(),
  ),
  TabBarItem(
    label: 'Dice',
    icon: CupertinoIcons.cube,
    viewWidget: const DiceView(),
  )
];

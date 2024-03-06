import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/clue_view.dart';
import 'package:mini_solo/views/dice_view.dart';
import 'package:mini_solo/views/faction_view.dart';
import 'package:mini_solo/views/lists_view.dart';
import 'package:mini_solo/views/person_view.dart';
import 'package:mini_solo/views/place_view.dart';
import 'package:mini_solo/views/scene_view.dart';
import 'package:mini_solo/views/thing_view.dart';
import 'package:mini_solo/widgets/dice_bar.dart';
import 'package:mini_solo/widgets/output.dart';

class DividerView extends StatelessWidget {
  const DividerView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MyHomePageIOS extends StatefulWidget {
  const MyHomePageIOS({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePageIOS> createState() => _MyHomePageIOSState();
}

class ViewItem {
  String label;
  IconData icon;
  Widget viewWidget;

  ViewItem({required this.label, required this.icon, required this.viewWidget});
}

List<ViewItem> viewItems = [
  ViewItem(
    label: 'Journal',
    icon: CupertinoIcons.book,
    viewWidget: const SceneView(),
  ),
  ViewItem(
    label: 'New',
    icon: CupertinoIcons.star,
    viewWidget: const SceneView(),
  ),
  ViewItem(
    label: 'Trackers',
    icon: CupertinoIcons.check_mark_circled,
    viewWidget: const SceneView(),
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

class _MyHomePageIOSState extends State<MyHomePageIOS> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: CupertinoColors.systemGreen,
      tabBar: CupertinoTabBar(
          items: viewItems
              .map(
                (e) => BottomNavigationBarItem(
                  label: e.label,
                  icon: Icon(e.icon),
                ),
              )
              .toList()),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                leading: CupertinoButton(
                  onPressed: handleSettingsPressed,
                  padding: EdgeInsets.all(0.0),
                  child: Text('5'),
                ),
                middle: Text('Solo app'),
                trailing: CupertinoButton(
                  onPressed: handleSettingsPressed,
                  child: Icon(CupertinoIcons.settings_solid),
                ),
              ),
              child: SafeArea(
                  child: viewItems.map((e) => e.viewWidget).toList()[index]),
            );
          },
        );
      },
    );
  }
}

void handleSettingsPressed() {
  print('pressed');
}

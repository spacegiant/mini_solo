import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/dice_view.dart';
import 'package:mini_solo/views/journal_view.dart';
import 'package:mini_solo/views/lists_view.dart';
import 'package:mini_solo/views/new_view.dart';
import 'package:mini_solo/views/settings_view.dart';
import 'package:mini_solo/views/tracker_view.dart';

class ChaosFactor extends ChangeNotifier {
  late int _chaosFactor = 5;

  int get chaosFactor => _chaosFactor;
  int maxChaos = 9;
  int minChaos = 1;

  void increase() {
    _chaosFactor < maxChaos ? _chaosFactor++ : null;
    notifyListeners();
  }

  void decrease() {
    _chaosFactor > minChaos ? _chaosFactor-- : null;
    notifyListeners();
  }

  void reset() {
    _chaosFactor = 5;
    notifyListeners();
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
    icon: CupertinoIcons.star,
    viewWidget: const NewView(),
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

class _MyHomePageIOSState extends State<MyHomePageIOS> {
  bool showSettings = false;

  @override
  Widget build(BuildContext context) {
    return showSettings
        ? SettingsView(
            title: widget.title,
            closeSettings: () => setState(() {
              showSettings = false;
            }),
          )
        : CupertinoTabScaffold(
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
                    navigationBar: CupertinoNavigationBar(
                      leading: CupertinoButton(
                        onPressed: () {
                          print('CF pressed');
                        },
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              CupertinoIcons.settings_solid,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Consumer<ChaosFactor>(
                              builder: (context, chaosFactor, child) => Text(
                                chaosFactor.chaosFactor.toString(),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                      ),
                      middle: Text('Solo app $showSettings'),
                      trailing: CupertinoButton(
                        padding: const EdgeInsets.all(0.0),
                        onPressed: () {
                          setState(() {
                            showSettings = true;
                          });
                        },
                        child: const Icon(
                          CupertinoIcons.settings_solid,
                        ),
                      ),
                    ),
                    child: SafeArea(
                        child:
                            viewItems.map((e) => e.viewWidget).toList()[index]),
                  );
                },
              );
            },
          );
  }
}

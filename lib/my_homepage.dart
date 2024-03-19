import 'package:mini_solo/view_items.dart';
import 'package:mini_solo/widgets/chaos_factor.dart';
import 'package:mini_solo/widgets/list_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/views/settings_view.dart';

class MyHomePageIOS extends StatefulWidget {
  const MyHomePageIOS({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePageIOS> createState() => _MyHomePageIOSState();
}

class _MyHomePageIOSState extends State<MyHomePageIOS> {
  bool showSettings = false;
  bool showPopup = false;

  void togglePopup() {
    setState(() => showPopup = !showPopup);
  }

  void toggleSettings() {
    setState(() => showSettings = !showSettings);
  }

  @override
  Widget build(BuildContext context) {
    return showSettings
        ? SettingsView(
            title: widget.title,
            closeSettings: toggleSettings,
          )
        : CupertinoTabScaffold(
            tabBar: tabBar(),
            tabBuilder: (BuildContext context, int index) {
              return tabView(index, togglePopup, toggleSettings);
            },
          );
  }

  CupertinoTabView tabView(int index, Function() togglePopup, toggleSettings) {
    return CupertinoTabView(
      builder: (BuildContext context) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: CupertinoButton(
              onPressed: () {
                togglePopup();
              },
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer<ChaosFactor>(
                    builder: (context, chaosFactor, child) => Text(
                      'CF ${chaosFactor.value}',
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ),
            middle: const Text('Solo app'),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: toggleSettings,
              child: const Icon(
                CupertinoIcons.settings_solid,
              ),
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                viewItems.map((e) => e.viewWidget).toList()[index],
                chaosFactorPopup(context, showPopup, togglePopup),
              ],
            ),
          ),
        );
      },
    );
  }

  CupertinoTabBar tabBar() {
    return CupertinoTabBar(
        items: viewItems
            .map((e) => BottomNavigationBarItem(
                  label: e.label,
                  icon: Icon(e.icon),
                ))
            .toList());
  }
}

import 'package:mini_solo/view_items.dart';
import 'package:mini_solo/widgets/app_state.dart';
import 'package:mini_solo/widgets/popup.dart';
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
              return tabView(index, toggleSettings);
            },
          );
  }

  Consumer<AppState> tabView(int index, toggleSettings) {
    var appState = context.read<AppState>();

    return Consumer<AppState>(builder: (context, appState, child) {
      return CupertinoTabView(
        builder: (BuildContext context) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                onPressed: () {
                  appState.setPopupLabel(PopupLabels.chaos);
                  appState.toggleShowPopup();
                },
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CF ${appState.chaosFactor}',
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
              middle: const Text('Solo App'),
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
                  popup(context),
                ],
              ),
            ),
          );
        },
      );
    });
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

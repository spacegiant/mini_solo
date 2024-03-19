import 'package:mini_solo/view_items.dart';
import 'package:mini_solo/widgets/chaos_factor_popup.dart';
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
  String popupContent = '';

  void toggleChaosFactorPopup() {
    setState(() {
      showPopup = !showPopup;
      popupContent = 'cf';
    });
  }

  // void toggleFatePopup() {
  //   setState(() {
  //     showPopup = !showPopup;
  //     popupContent = 'fate';
  //   });
  // }

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
              return tabView(index, toggleChaosFactorPopup, toggleSettings);
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
                popup(
                  context,
                  showPopup,
                  togglePopup,
                  getPopupContent(popupContent, togglePopup),
                ),
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

Widget getPopupContent(
  String reference,
  togglePopup,
) {
  if (reference == 'cf') {
    return ChaosFactorPopup(
      togglePopup: togglePopup,
    );
  } else {
    return const Text('test');
  }
}

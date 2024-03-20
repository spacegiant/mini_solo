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
        : Consumer<AppState>(
            builder: (context, appState, child) {
              return homePageTabScaffold(appState);
            },
          );
  }

  GestureDetector homePageTabScaffold(AppState appState) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CupertinoTabScaffold(
        tabBar: homePageTabBar(appState.closePopup),
        tabBuilder: (BuildContext context, int index) {
          return homePageTabView(index, toggleSettings);
        },
      ),
    );
  }

  Consumer<AppState> homePageTabView(int index, toggleSettings) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return CupertinoTabView(
        builder: (BuildContext context) {
          return CupertinoPageScaffold(
            navigationBar: homePageNavigationBar(appState, toggleSettings),
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

  CupertinoNavigationBar homePageNavigationBar(
      AppState appState, toggleSettings) {
    return CupertinoNavigationBar(
      leading: homePageChaosFactorButton(appState),
      middle: const Text('Solo App'),
      trailing: homePageSettingsButton(toggleSettings),
    );
  }

  CupertinoButton homePageSettingsButton(toggleSettings) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      onPressed: toggleSettings,
      child: const Icon(
        CupertinoIcons.settings_solid,
      ),
    );
  }

  CupertinoButton homePageChaosFactorButton(AppState appState) {
    return CupertinoButton(
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
    );
  }

  CupertinoTabBar homePageTabBar(Function() handleClosePopup) {
    return CupertinoTabBar(
        onTap: (value) {
          handleClosePopup();
        },
        items: viewItems
            .map((e) => BottomNavigationBarItem(
                  label: e.label,
                  icon: Icon(e.icon),
                ))
            .toList());
  }
}

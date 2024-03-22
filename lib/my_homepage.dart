import 'package:mini_solo/utilities/campaign_data.dart';
import 'package:mini_solo/utilities/campaign_storage.dart';
import 'package:mini_solo/utilities/init_form.dart';
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
    required this.storage,
  });

  final String title;
  final CampaignStorage storage;

  @override
  State<MyHomePageIOS> createState() => _MyHomePageIOSState();
}

class _MyHomePageIOSState extends State<MyHomePageIOS> {
  CampaignData? campaignData;

  @override
  void initState() {
    super.initState();

    widget.storage.readJSON().then((data) {
      var appState = context.read<AppState>();
      if (data != null) {
        appState.setCampaignData(data);
      }
    });
  }

  void initCampaignData(String campaignName) {
    var appState = context.read<AppState>();
    CampaignData campaignData = initCampaignDataData(campaignName);
    appState.setCampaignData(campaignData);
    widget.storage.writeJSON(campaignData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
        var appState = context.read<AppState>();

        if (appState.campaignData == null) {
          return CupertinoPageScaffold(
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<AppState>(
                builder:
                    (BuildContext context, AppState appState, Widget? child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Welcome to Solo App'),
                      InitForm(
                        initCampaignData: initCampaignData,
                      ),
                      const SizedBox.shrink(),
                    ],
                  );
                },
              ),
            )),
          );
        } else if (appState.showSettings == true) {
          return SettingsView(
            title: widget.title,
            closeSettings: appState.toggleShowSettings,
          );
        } else {
          return Consumer<AppState>(
            builder: (context, appState, child) {
              return homePageTabScaffold(
                appState,
                appState.toggleShowSettings,
              );
            },
          );
        }
      },
    );
  }

  GestureDetector homePageTabScaffold(
    AppState appState,
    Function() toggleSettings,
  ) {
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
                  tabBarItems.map((e) => e.viewWidget).toList()[index],
                  popup(context),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  CupertinoTabBar homePageTabBar(Function() handleClosePopup) {
    return CupertinoTabBar(
      onTap: (value) {
        handleClosePopup();
      },
      items: tabBarItems
          .map((e) => BottomNavigationBarItem(
                label: e.label,
                icon: Icon(e.icon),
              ))
          .toList(),
    );
  }

  CupertinoNavigationBar homePageNavigationBar(
      AppState appState, toggleSettings) {
    return CupertinoNavigationBar(
      leading: homePageChaosFactorButton(appState),
      middle: GestureDetector(
          onTap: () {
            appState.setPopupLabel(PopupLabels.campaignManager);
            appState.toggleShowPopup();
          },
          child: Text(appState.campaignData!.name)),
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
}

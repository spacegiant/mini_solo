import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/campaign_storage.dart';
import 'package:mini_solo/utilities/init_form.dart';
import 'package:mini_solo/view_items.dart';
import 'package:mini_solo/data/app_state.dart';
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

    String? currentCampaign;

    widget.storage.printLocalPath();

    // IF CAN READ APP SETTINGS DO THIS...
    widget.storage.readAppSettings('appSettings.json').then((data) {
      AppState appState = context.read<AppState>();
      appState.setAppSettingsData(data!);
      appState.setCampaignStorage(widget.storage);

      currentCampaign = data.currentCampaign;

      appState.setAppSettingsSaveCallback(saveAppSettings);

      if (currentCampaign != null && currentCampaign != '') {
        widget.storage.readJSON('$currentCampaign.json').then((data) {
          if (data != null) {
            appState.setCampaignData(data);
          }
        });
      }
    });
  }

  //
  void initCampaignData(String campaignName) {
    var appState = context.read<AppState>();
    CampaignData campaignData = initCampaignDataData(campaignName);
    AppSettingsData appSettingsData = appState.appSettingsData;
    appState.setCampaignData(campaignData);
    saveAppSettings(appSettingsData);
    saveCampaign(campaignData);
  }

  void loadData(String filename) {
    widget.storage.readJSON('$filename.json').then((data) {
      var appState = context.read<AppState>();

      if (data != null) {
        appState.setCampaignData(data);
      }
    });
  }

  void saveCampaign(CampaignData campaignData) {
    widget.storage.writeJSON(campaignData, '${campaignData.filename}.json');
  }

  void saveAppSettings(AppSettingsData appSettingsData) {
    widget.storage.writeAppSettingsJSON(appSettingsData, 'appSettings.json');
  }

  void deleteCampaign(String filename) {
    widget.storage.deleteCampaign('$filename.json');
  }

  // List<String?> getCampaignList() {
  //   widget.storage.getCampaignsList.then((list) {
  //     return list;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (BuildContext context, AppState appState, Widget? child) {
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
              if (appState.saveCallbackExists == false) {
                appState.setSaveCampaignCallback(saveCampaign);
              }

              if (appState.deleteCampaign == false) {
                appState.setDeleteCampaignCallback(deleteCampaign);
              }

              return Stack(
                children: [
                  FocusScope(
                    child: homePageTabScaffold(
                      appState,
                      appState.toggleShowSettings,
                    ),
                  ),
                  FocusScope(
                    child: SafeArea(
                        child: popup(
                      context,
                      widget,
                    )),
                  ),
                ],
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
    List<TabBarItem> myTabBarItems = List.from(tabBarItems);
    bool showFutureSettings =
        appState.campaignData!.settings.general.showFutureSettings;
    if (showFutureSettings == false) {
      myTabBarItems.removeWhere((element) => element.label == 'Starred');
      myTabBarItems.removeWhere((element) => element.label == 'Trackers');
      myTabBarItems.removeWhere((element) => element.label == 'Lists');
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CupertinoTabScaffold(
        tabBar: homePageTabBar(myTabBarItems, appState.closePopup),
        tabBuilder: (BuildContext context, int index) {
          return homePageTabView(index, toggleSettings, myTabBarItems);
        },
      ),
    );
  }

  Consumer<AppState> homePageTabView(
    int index,
    toggleSettings,
    List<TabBarItem> tabBarItems,
  ) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return CupertinoTabView(
        builder: (BuildContext context) {
          return CupertinoPageScaffold(
            navigationBar: homePageNavigationBar(appState, toggleSettings),
            child: SafeArea(
                child: tabBarItems.map((e) => e.viewWidget).toList()[index]),
          );
        },
      );
    });
  }

  CupertinoTabBar homePageTabBar(
    List<TabBarItem> tabBarItems,
    Function() handleClosePopup,
  ) {
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
            appState.toggleShowPopup(label: PopupLabel.campaignManager);
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
        appState.toggleShowPopup(label: PopupLabel.chaos);
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

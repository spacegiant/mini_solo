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

    widget.storage.readAppSettings('appSettings.json').then((data) {
      currentCampaign = data;

      widget.storage.readJSON('${currentCampaign!}.json').then((data) {
        var appState = context.read<AppState>();

        if (data != null) {
          appState.setCampaignData(data);
        }
      });
    });
  }

  void initCampaignData(String campaignName) {
    var appState = context.read<AppState>();
    CampaignData campaignData = initCampaignDataData(campaignName);
    appState.setCampaignData(campaignData);
    saveAppSettings(campaignData.filename);
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

  void saveAppSettings(String campaignName) {
    widget.storage.writeAppSettingsJSON(campaignName, 'appSettings.json');
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
                appState.setSaveCallback(saveCampaign);
              }

              if (appState.deleteCampaign != false) {
                print('delete compaign does not exist');
                appState.setDeleteCampaignCallback(deleteCampaign);
              }

              return Stack(
                children: [
                  homePageTabScaffold(
                    appState,
                    appState.toggleShowSettings,
                  ),
                  SafeArea(
                      child: popup(
                    context,
                    widget,
                  )),
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
    // FIXME: Build tab pages data here and pass down
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
            appState.toggleShowPopup(label: PopupLabels.campaignManager);
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
        appState.toggleShowPopup(label: PopupLabels.chaos);
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

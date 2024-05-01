import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../my_homepage.dart';
import 'chaos_factor_popup.dart';
import 'game_mode_control.dart';

class CampaignManager extends StatefulWidget {
  const CampaignManager({
    super.key,
    required this.getCampaignList,
  });

  final Future<List<FileSystemEntity>> getCampaignList;

  @override
  State<CampaignManager> createState() => _CampaignManagerState();
}

class _CampaignManagerState extends State<CampaignManager> {
  @override
  Widget build(
    BuildContext context,
  ) {
    // TODO: POC GET ALL FILES IN DIRECTORY
    Future<List<FileSystemEntity>> campaigns = widget.getCampaignList;
    // campaigns.then((campaigns) {
    //   print('---');
    //   print(campaigns[0].path);
    //   print(campaigns[0].absolute);
    //   print(campaigns[0].isAbsolute);
    //   print(campaigns[0].parent);
    //   print(campaigns[0].uri);
    //   print(campaigns[0].hashCode);
    // });
    return FutureBuilder(
        future: campaigns,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          // TODO: Tests for this
          if (snapshot.hasData) {
            // TODO: iterate over list
            return Text('${snapshot.data}');
          } else if (snapshot.hasError) {
            // TODO: What to do here?
            return const Text('CAMPAIGN MANAGER');
          } else {
            // TODO: Loading state
            return const Text('CAMPAIGN MANAGER');
          }
        });
  }
}

Consumer<Object?> popup(
  BuildContext context,
  MyHomePageIOS? widget,
) {
  return Consumer<AppState>(
    builder: (BuildContext context, appState, Widget? child) {
      PopupLabels popup = appState.popupLabel;
      print(appState.popupLabel);
      return Visibility(
        visible: appState.showPopup,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoPopupSurface(
            // child: Center(child: child),
            child: Center(
              child: Column(
                children: [
                  CupertinoButton(
                      child: const Text('Close'),
                      onPressed: () {
                        appState.closePopup();
                      }),
                  // WIDGETS
                  if (popup == PopupLabels.chaos)
                    const ChaosFactorPopup()
                  else if (popup == PopupLabels.fate)
                    const Text('FATE')
                  else if (popup == PopupLabels.endScene)
                    const Text('END SCENE')
                  else if (popup == PopupLabels.combat)
                    const Text('COMBAT')
                  else if (popup == PopupLabels.social)
                    const Text('SOCIAL')
                  else if (popup == PopupLabels.exploration)
                    const Text('EXPLORATION')
                  else if (popup == PopupLabels.travel)
                    const Text('TRAVEL')
                  else if (popup == PopupLabels.investigation)
                    const Text('INVESTIGATE')
                  else if (popup == PopupLabels.addJournalEntry)
                    const AddToJournalPanel()
                  else if (popup == PopupLabels.journalFilter)
                    const Text('JOURNAL FILTER')
                  else if (popup == PopupLabels.campaignManager)
                    CampaignManager(
                      getCampaignList: widget!.storage.getCampaignsList,
                    )
                  else if (popup == PopupLabels.fullJournal)
                    const Text('FULL JOURNAL')
                  else if (popup == PopupLabels.editField)
                    const Text('EDIT FIELD')
                  else
                    const SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

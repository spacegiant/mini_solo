import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import 'chaos_factor_popup.dart';
import 'game_mode_control.dart';

Map<PopupLabels, Widget> popupContentMap = {
  PopupLabels.chaos: const ChaosFactorPopup(),
  PopupLabels.fate: const Text('FATE'),
  PopupLabels.endScene: const Text('END SCENE'),
  PopupLabels.combat: const Text('COMBAT'),
  PopupLabels.social: const Text('SOCIAL'),
  PopupLabels.exploration: const Text('EXPLORATION'),
  PopupLabels.travel: const Text('TRAVEL'),
  PopupLabels.investigation: const Text('INVESTIGATE'),
  PopupLabels.addJournalEntry: const AddToJournalPanel(),
  PopupLabels.journalFilter: const Text('JOURNAL FILTER'),
  PopupLabels.campaignManager: const Text('CAMPAIGN MANAGER'),
  PopupLabels.fullJournal: const Text('FULL JOURNAL'),
  PopupLabels.editField: const Text('EDIT FIELD'),
};

Consumer<Object?> popup(BuildContext context) {
  return Consumer<AppState>(
    builder: (BuildContext context, appState, Widget? child) {
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
                  popupContentMap[appState.popupLabel] ??
                      const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

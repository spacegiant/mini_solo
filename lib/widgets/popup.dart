import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../utilities/app_state.dart';
import 'chaos_factor_popup.dart';

Map<PopupLabels, Widget> popupContentMap = {
  PopupLabels.chaos: const ChaosFactorPopup(),
  PopupLabels.fate: const Text('FATE'),
  PopupLabels.endScene: const Text('END SCENE'),
  PopupLabels.combat: const Text('COMBAT'),
  PopupLabels.social: const Text('SOCIAL'),
  PopupLabels.exploration: const Text('EXPLORATION'),
  PopupLabels.travel: const Text('TRAVEL'),
  PopupLabels.investigation: const Text('INVESTIGATE'),
  PopupLabels.addJournalEntry: const Text('ADD JOURNAL ENTRY'),
  PopupLabels.journalFilter: const Text('JOURNAL FILTER'),
  PopupLabels.campaignManager: const Text('CAMPAIGN MANAGER'),
  PopupLabels.fullJournal: const Text('FULL JOURNAL'),
};

Consumer<Object?> popup(BuildContext context) {
  return Consumer<AppState>(
    builder: (BuildContext context, appState, Widget? child) {
      return Visibility(
        visible: appState.showPopup,
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
                popupContentMap[appState.popupLabel] ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

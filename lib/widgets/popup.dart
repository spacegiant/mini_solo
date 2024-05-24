import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/campaign_manager_popup.dart';
import 'package:mini_solo/widgets/popups/edit_note_popup.dart';
import 'package:provider/provider.dart';
import '../data/app_state.dart';
import '../my_homepage.dart';
import 'chaos_factor_popup.dart';
import 'game_mode_control.dart';

Consumer<Object?> popup(
  BuildContext context,
  MyHomePageIOS? widget,
) {
  return Consumer<AppState>(
    builder: (BuildContext context, appState, Widget? child) {
      PopupLabels popup = appState.popupLabel;
      double popupHeight =
          popup == PopupLabels.editNote ? 400.0 : double.infinity;
      return Visibility(
        visible: appState.showPopup,
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CupertinoPopupSurface(
                child: SizedBox(
                  height: popupHeight,
                  width: 400.0,
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
                      else if (popup == PopupLabels.editNote)
                        // if (id != null)
                        EditNotePopup(
                          appState: appState,
                        )
                      else
                        const SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

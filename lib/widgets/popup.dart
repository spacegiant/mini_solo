import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/campaign_manager_popup.dart';
import 'package:mini_solo/widgets/popups/edit_mythic_entry_popup.dart';
import 'package:mini_solo/widgets/popups/edit_note_popup.dart';
import 'package:mini_solo/widgets/popups/edit_rolls_popup.dart';
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
      double popupHeight = double.infinity;
      Widget popupWidget;

      // WIDGETS
      if (popup == PopupLabels.chaos) {
        popupWidget = const ChaosFactorPopup();
      } else if (popup == PopupLabels.addJournalEntry) {
        popupWidget = const AddToJournalPanel();
      } else if (popup == PopupLabels.journalFilter) {
        popupWidget = const Text('JOURNAL FILTER');
      } else if (popup == PopupLabels.campaignManager) {
        popupWidget = CampaignManager(
          getCampaignList: widget!.storage.getCampaignsList,
        );
      } else if (popup == PopupLabels.fullJournal) {
        popupWidget = const Text('FULL JOURNAL');
      } else if (popup == PopupLabels.editField) {
        popupWidget = const Text('EDIT FIELD');
      } else if (popup == PopupLabels.editNote) {
        popupHeight = 420.0;
        popupWidget = EditNotePopup(
          appState: appState,
        );
      } else if (popup == PopupLabels.editMythicEntry) {
        popupHeight = 160.0;
        popupWidget = EditMythicEntryPopup(
          appState: appState,
        );
      } else if (popup == PopupLabels.editRoll) {
        popupHeight = 160.0;
        popupWidget = EditRollPopup(appState: appState);
      } else {
        popupWidget = const SizedBox.shrink();
      }

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
                      popupWidget,
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

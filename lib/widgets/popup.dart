import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/add_random_table_popup.dart';
import 'package:mini_solo/widgets/popups/campaign_manager_popup.dart';
import 'package:mini_solo/widgets/popups/edit_mythic_entry_popup.dart';
import 'package:mini_solo/widgets/popups/edit_new_scene_entry_popup.dart';
import 'package:mini_solo/widgets/popups/edit_note_popup.dart';
import 'package:mini_solo/widgets/popups/edit_oracle_entry_popup.dart';
import 'package:mini_solo/widgets/popups/edit_random_table_popup.dart';
import 'package:mini_solo/widgets/popups/edit_roll_table_result_popup.dart';
import 'package:mini_solo/widgets/popups/edit_rolls_popup.dart';
import 'package:mini_solo/widgets/popups/import_manager.dart';
import 'package:mini_solo/widgets/popups/manage_tracker_popup.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
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
      PopupLabel popup = appState.popupLabel;
      double popupHeight = kPopupDefaultHeight;
      Widget popupWidget;

      // TODO refactor to make easier to read

      // WIDGETS
      if (popup == PopupLabel.chaos) {
        popupWidget = const ChaosFactorPopup();
      } else if (popup == PopupLabel.manageTracker) {
        popupHeight = 700.0;
        popupWidget = ManageTrackerPopup(appState: appState);
      } else if (popup == PopupLabel.importManager) {
        popupHeight = 700.0;
        popupWidget = ImportManager(appState: appState);
      } else if (popup == PopupLabel.addJournalEntry) {
        popupWidget = const AddToJournalPanel();
      } else if (popup == PopupLabel.editRandomTable) {
        popupHeight = 600.0;
        popupWidget = EditRandomTable(
          appState: appState,
        );
      } else if (popup == PopupLabel.journalFilter) {
        popupWidget = const Text('JOURNAL FILTER');
      } else if (popup == PopupLabel.campaignManager) {
        popupHeight = 600.0;
        popupWidget = CampaignManager(
          getCampaignList: widget!.storage.getCampaignsList,
          appState: appState,
        );
      } else if (popup == PopupLabel.fullJournal) {
        popupWidget = const Text('FULL JOURNAL');
      } else if (popup == PopupLabel.addRandomTable) {
        popupHeight = 500.0;
        popupWidget = AddRandomTablePopup(
          appState: appState,
        );
      } else if (popup == PopupLabel.editRollTableResult) {
        popupWidget = EditRollTableResultPopup(appState: appState);
      } else if (popup == PopupLabel.editField) {
        popupWidget = const Text('EDIT FIELD');
      } else if (popup == PopupLabel.editNote) {
        popupHeight = 420.0;
        popupWidget = EditNotePopup(
          appState: appState,
        );
      } else if (popup == PopupLabel.editMythicEntry) {
        popupHeight = 160.0;
        popupWidget = EditMythicEntryPopup(
          appState: appState,
        );
      } else if (popup == PopupLabel.editRoll) {
        popupHeight = 160.0;
        popupWidget = EditRollPopup(appState: appState);
      } else if (popup == PopupLabel.editOracleEntry) {
        popupHeight = 160.0;
        popupWidget = EditOracleEntryPopup(appState: appState);
      } else if (popup == PopupLabel.editNewSceneEntry) {
        popupHeight = 160.0;
        popupWidget = EditNewSceneEntryPopup(appState: appState);
      } else {
        popupWidget = const SizedBox.shrink();
      }

      return Visibility(
        visible: appState.showPopup,
        child: GestureDetector(
          onTap: () {
            // FIXME event triggers inside the popup not just on background
            // appState.closePopup();
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: kBackdropFilterColour,
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(
                    height: popupHeight,
                    width: 400.0,
                    child: CupertinoPopupSurface(
                      child: Column(
                        children: [
                          CupertinoButton(
                              child: const Text(kPopupCloseButtonLabel),
                              onPressed: () {
                                appState.closePopup();
                              }),
                          const Divider(),
                          popupWidget,
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
    },
  );
}

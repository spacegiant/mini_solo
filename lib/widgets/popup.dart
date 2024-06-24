import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_solo/widgets/popups/add_group_popup.dart';
import 'package:mini_solo/widgets/popups/add_random_table_popup.dart';
import 'package:mini_solo/widgets/popups/campaign_manager_popup.dart';
import 'package:mini_solo/widgets/popups/edit_group_popup.dart';
import 'package:mini_solo/widgets/popups/edit_mythic_entry_popup.dart';
import 'package:mini_solo/widgets/popups/edit_new_scene_entry_popup.dart';
import 'package:mini_solo/widgets/popups/edit_note_popup.dart';
import 'package:mini_solo/widgets/popups/edit_oracle_entry_popup.dart';
import 'package:mini_solo/widgets/popups/edit_random_table_popup.dart';
import 'package:mini_solo/widgets/popups/edit_roll_table_result_popup.dart';
import 'package:mini_solo/widgets/popups/edit_rolls_popup.dart';
import 'package:mini_solo/widgets/popups/edit_tracker_popup.dart';
import 'package:mini_solo/widgets/popups/import_manager.dart';
import 'package:mini_solo/widgets/popups/add_tracker_popup.dart';
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

      switch (popup) {
        case PopupLabel.addJournalEntry:
          popupWidget = const AddToJournalPanel();
          break;
        case PopupLabel.addRandomTable:
          popupHeight = 530.0;
          popupWidget = AddRandomTablePopup(appState: appState);
          break;
        case PopupLabel.campaignManager:
          popupHeight = 600.0;
          popupWidget = CampaignManager(
            getCampaignList: widget!.storage.getCampaignsList,
            appState: appState,
          );
          break;
        case PopupLabel.chaos:
          popupWidget = const ChaosFactorPopup();
          break;
        case PopupLabel.editField:
          popupWidget = const Text('EDIT FIELD');
          break;
        case PopupLabel.editNote:
          popupHeight = 420.0;
          popupWidget = EditNotePopup(appState: appState);
          break;
        case PopupLabel.editMythicEntry:
          popupHeight = 160.0;
          popupWidget = EditMythicEntryPopup(appState: appState);
          break;
        case PopupLabel.editNewSceneEntry:
          popupHeight = 240.0;
          popupWidget = EditNewSceneEntryPopup(appState: appState);
          break;
        case PopupLabel.editOracleEntry:
          popupHeight = 160.0;
          popupWidget = EditOracleEntryPopup(appState: appState);
          break;
        case PopupLabel.editRoll:
          popupHeight = 160.0;
          popupWidget = EditRollPopup(appState: appState);
          break;
        case PopupLabel.fullJournal:
          popupWidget = const Text('FULL JOURNAL');
          break;
        case PopupLabel.journalFilter:
          popupWidget = const Text('JOURNAL FILTER');
          break;
        case PopupLabel.editRandomTable:
          popupHeight = 600.0;
          popupWidget = EditRandomTable(appState: appState);
          break;
        case PopupLabel.editRollTableResult:
          popupWidget = EditRollTableResultPopup(appState: appState);
          break;
        case PopupLabel.importManager:
          popupHeight = 700.0;
          popupWidget = ImportManager(appState: appState);
          break;
        case PopupLabel.createTracker:
          popupHeight = 710.0;
          popupWidget = AddTrackerPopup(appState: appState);
          break;
        case PopupLabel.editTracker:
          popupHeight = 500.0;
          popupWidget = EditTrackerPopup(appState: appState);
          break;
        case PopupLabel.addGroup:
          popupWidget = AddGroupPopup(appState: appState);
          break;
        case PopupLabel.editGroup:
          popupWidget = EditGroupPopup(
            appState: appState,
            groupId: '',
          );
          break;
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
                        // mainAxisSize: MainAxisSize.min,
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

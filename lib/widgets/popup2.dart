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

Consumer<Object?> popup2(
  BuildContext context,
  MyHomePageIOS? widget,
) {
  return Consumer<AppState>(
    builder: (BuildContext context, AppState appState, Widget? child) {
      double popupHeight = kPopupDefaultHeight;
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
                          child ?? const SizedBox.shrink(),
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

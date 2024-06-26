import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/widgets/popups/add_label_popup.dart';
import 'package:mini_solo/widgets/popups/add_tracker_popup.dart';
import 'package:mini_solo/widgets/popups/edit_label_popup.dart';
import 'package:mini_solo/widgets/popups/edit_random_table_popup.dart';
import 'package:mini_solo/widgets/popups/toggle_show_popup.dart';

import '../../data/app_settings_data.dart';
import '../../data/app_state.dart';
import '../../features/random_tables/roll_table.dart';
import '../../features/trackers/bar_tracker_control.dart';
import '../../features/trackers/clock_tracker_control.dart';
import '../../features/trackers/counter_tracker_control.dart';
import '../../features/trackers/fate_aspect_tracker.dart';
import '../../features/trackers/ironsworn_tracker_control.dart';
import '../../features/trackers/pips_tracker_control.dart';
import '../../features/trackers/value_tracker_widget.dart';
import '../../svg_icon.dart';
import '../../utilities/get_random_result.dart';
import '../../utilities/test_scene.dart';
import '../../widgets/list_button.dart';
import '../../widgets/popups/add_group_popup.dart';
import '../../widgets/popups/add_random_table_popup.dart';
import '../../widgets/popups/edit_groups_popup.dart';
import '../dice/dice_button.dart';
import '../dice/other_dice_sets.dart';
import '../mythic/fate_question.dart';
import 'control_data.dart';
import 'get_event_focus.dart';

enum ControlTypeEnum {
  button,
  dice,
  diceGroup,
  mythicChart,
  newScene,
  mythicExpectedScene,
  mythicAction,
  mythicDescription,
  mythicEventFocus,
  mythicPlotTwist,
  randomTable,
  // TRACKER TYPES
  clock4,
  clock6,
  clock8,
  bar,
  ironsworn1Troublesome,
  ironsworn2Dangerous,
  ironsworn3Formidable,
  ironsworn4Extreme,
  ironsworn5Epic,
  pips,
  value,
  counter,
  fate_aspect,
  newTracker,
  newRandomTable,
  newGroup,
  statBlock,
  newLabel,
}

Widget chooseControlWidget({
  required ControlData controlData,
  required AppState appState,
  required BuildContext context,
  int? color,
}) {
  Color buttonColor = color != null ? Color(color) : kButtonColor;

  IconData icon;

  switch (controlData.controlType) {
    case ControlTypeEnum.button:
      return ListButton(
        color: buttonColor,
        label: controlData.label,
        onPressed: () {},
      );
    case ControlTypeEnum.newScene:
      return ListButton(
        color: buttonColor,
        label: controlData.label,
        onPressed: () {
          int sceneNumber = appState.campaignData!.newScene.length + 1;
          appState.addNewScene(NewSceneEntry(label: 'Scene #$sceneNumber'));
        },
      );
    case ControlTypeEnum.mythicChart:
      return ListButton(
          color: buttonColor,
          label: controlData.label,
          onPressed: () {
            fateChartControlOnPressed(controlData.fateChartRow, appState);
          });
    case ControlTypeEnum.mythicExpectedScene:
      return ListButton(
          color: buttonColor,
          label: controlData.label,
          onPressed: () {
            JournalReturnObject test = testScene(appState);

            appState.addOracleEntry(
              OracleEntry(
                  isFavourite: false,
                  lines: test,
                  label: 'Test Expected Scene'),
            );
          });
    case ControlTypeEnum.mythicAction:
      return ListButton(
        color: buttonColor,
        label: 'Mythic Action',
        onPressed: () {
          getRandomResult(
            appState: appState,
            label: 'Mythic Action',
            jsonPath: 'mythic/mythic_action.json',
            table1: 'table1',
            table2: 'table2',
            onResult: (appState, result, label) {
              appState.addMythicEntry(
                // TODO: Can MythicEntry be swapped and eventually removed?
                MythicEntry(
                  isFavourite: false,
                  lines: result,
                  label: 'Mythic Action',
                ),
              );
            },
          );
        },
      );
    case ControlTypeEnum.mythicDescription:
      return ListButton(
        color: buttonColor,
        label: 'Mythic Description',
        onPressed: () {
          getRandomResult(
            appState: appState,
            label: 'Mythic Description',
            jsonPath: 'mythic/mythic_description.json',
            table1: 'table1',
            table2: 'table2',
            onResult: (appState, result, label) {
              appState.addMythicEntry(
                MythicEntry(
                  isFavourite: false,
                  lines: result,
                  label: 'Mythic Description',
                ),
              );
            },
          );
        },
      );
    case ControlTypeEnum.mythicEventFocus:
      return ListButton(
        color: buttonColor,
        label: 'Event Focus',
        onPressed: () {
          getEventFocus(appState);
        },
      );
    case ControlTypeEnum.mythicPlotTwist:
      return ListButton(
        color: buttonColor,
        label: 'Plot Twist',
        onPressed: () {
          getRandomResult(
            appState: appState,
            label: 'Mythic - Plot Twist',
            jsonPath: 'mythic_elements/plot_twist.json',
            table1: 'table',
            table2: 'table',
            onResult: (appState, result, label) {
              appState.addOracleEntry(
                OracleEntry(
                    isFavourite: false, lines: result, label: 'Plot Twist'),
              );
            },
          );
        },
      );
    case ControlTypeEnum.randomTable:
      return ListButton(
        color: buttonColor,
        label: controlData.label,
        iconData: FontAwesomeIcons.diceD6,
        onPressed: () {
          if (controlData.randomTable != null) {
            RollTableResult? result = rollTable(controlData.randomTable!);
            appState.addRandomTableResultsEntry(result!);
          }
        },
        onLongPress: () {
          toggleShowPopup2(
              maxWidth: 400.0,
              maxHeight: 600.0,
              child: EditRandomTable(
                appState: appState,
                id: controlData.controlId,
              ),
              context: context);
        },
      );
    case ControlTypeEnum.diceGroup:
      return Text(controlData.label);
    case ControlTypeEnum.dice:
      return DiceButton(
        dieType: d6oracle,
        label: 'D6 Oracle',
        icon: SVGIcon.d6Oracle,
        onPressed: (value) {},
      );
    //   TRACKERS
    case ControlTypeEnum.clock4:
    case ControlTypeEnum.clock6:
    case ControlTypeEnum.clock8:
      TrackerEntry? entry = getTrackerEntry(appState, controlData.controlId);
      if (entry == null) break;
      return ClockWidget(
        entry: getTrackerEntry(appState, controlData.controlId)!,
        appState: appState,
      );
    case ControlTypeEnum.bar:
      return BarWidget(
        entry: getTrackerEntry(appState, controlData.controlId)!,
        appState: appState,
      );
    case ControlTypeEnum.ironsworn1Troublesome:
    case ControlTypeEnum.ironsworn2Dangerous:
    case ControlTypeEnum.ironsworn3Formidable:
    case ControlTypeEnum.ironsworn4Extreme:
    case ControlTypeEnum.ironsworn5Epic:
      return IronswornWidget(
        entry: getTrackerEntry(appState, controlData.controlId)!,
        appState: appState,
      );
    case ControlTypeEnum.pips:
      return PipsWidget(
        entry: getTrackerEntry(appState, controlData.controlId)!,
        appState: appState,
      );
    case ControlTypeEnum.value:
      return ValueWidget(
        entry: getTrackerEntry(appState, controlData.controlId)!,
        appState: appState,
      );
    case ControlTypeEnum.counter:
      return CounterWidget(
        entry: getTrackerEntry(appState, controlData.controlId)!,
        appState: appState,
      );
    case ControlTypeEnum.fate_aspect:
      return FateWidget(
        entry: getTrackerEntry(appState, controlData.controlId)!,
        appState: appState,
      );
    case ControlTypeEnum.newTracker:
      return ListButton(
        color: buttonColor,
        onPressed: () {
          toggleShowPopup2(
              maxWidth: 600.0,
              maxHeight: 800.0,
              child: AddTrackerPopup(appState: appState),
              context: context);
        },
        label: controlData.label,
      );
    case ControlTypeEnum.newRandomTable:
      return ListButton(
        color: buttonColor,
        onPressed: () {
          toggleShowPopup2(
              maxWidth: 600.0,
              maxHeight: 520.0,
              child: AddRandomTablePopup(appState: appState),
              context: context);
        },
        label: controlData.label,
      );
    case ControlTypeEnum.newGroup:
      return ListButton(
        color: buttonColor,
        onLongPress: () {
          toggleShowPopup2(
              maxWidth: 400.0,
              maxHeight: 740.0,
              child: EditGroupsPopup(appState: appState),
              context: context);
        },
        onPressed: () {
          toggleShowPopup2(
            maxWidth: 400.0,
            maxHeight: 220.0,
            child: AddGroupPopup(appState: appState),
            context: context,
          );
        },
        label: 'New Group',
      );
    case ControlTypeEnum.statBlock:
      const Text('Stat Block');
    case ControlTypeEnum.newLabel:
      return ListButton(
        color: buttonColor,
        label: controlData.label,
        onPressed: () {
          toggleShowPopup2(
              child: AddLabelPopup(
                appState: appState,
              ),
              context: context);
        },
        onLongPress: () {
          toggleShowPopup2(
              child: EditLabelPopup(
                appState: appState,
              ),
              context: context);
        },
      );
  }
  return Text(controlData.label);
}

TrackerEntry? getTrackerEntry(AppState appState, String controlId) {
  try {
    return appState.campaignData?.tracker
        .firstWhere((tracker) => tracker.id == controlId);
  } catch (e) {
    return null;
  }
}

import 'package:flutter/cupertino.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import 'dice_tray.dart';
import 'group_container.dart';

Widget diceJournalControls(
  AppState appState,
  void Function(List<DiceRoll>) addResult,
) =>
    GroupContainer(
      label: 'Dice',
      containerId: 'group-dice',
      appState: appState,
      showDivider: false,
      groupId: 'group-dice',
      handleLongPress: () {},
      children: [
        diceTray(
          appState,
          addResult,
        ),
      ],
    );

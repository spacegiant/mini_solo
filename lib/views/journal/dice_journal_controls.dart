import 'package:flutter/cupertino.dart';
import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../widgets/popups/edit_dice_group_popup.dart';
import '../../widgets/popups/toggle_show_popup.dart';
import 'dice_tray.dart';
import 'group_container.dart';

Widget diceJournalControls(
  AppState appState,
  void Function(List<DiceRoll>) addResult,
  BuildContext context,
) =>
    GroupContainer(
      label: 'Dice',
      containerId: 'group-dice',
      appState: appState,
      showDivider: false,
      groupId: 'group-dice',
      isWrapped: appState.wrapDiceControls,
      handleLongPress: () {
        toggleShowPopup2(
            maxWidth: 400.0,
            maxHeight: 200.0,
            child: EditDiceGroupPopup(
              appState: appState,
            ),
            context: context);
      },
      children: [
        diceTray(
          appState,
          addResult,
        ),
      ],
    );

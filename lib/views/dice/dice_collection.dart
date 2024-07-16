import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../data/data_structures/dice_roll.dart';
import 'dice.dart';
import 'dice_button.dart';

class DiceCollection {
  const DiceCollection({
    required this.diceSet,
    required this.onPressed,
    required this.appState,
  });

  final DiceSet diceSet;
  final void Function(List<DiceRoll>) onPressed;
  final AppState appState;

  Iterable<DiceButton> getDice() {
    return diceSet.dieTypes.map((dieType) => DiceButton(
          dieType: dieType,
          onPressed: onPressed,
          icon: dieType.icon,
        ));
  }
}

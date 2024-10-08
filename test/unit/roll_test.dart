import 'package:mini_solo/data/data_structures/both_results.dart';
import 'package:mini_solo/data/data_structures/dice_roll.dart';
import 'package:mini_solo/data/data_structures/roll_entry_item.dart';
import 'package:mini_solo/svg_icon.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = RollEntryItem(
        // isFavourite: false,
        result: [
          DiceRoll(
              result: BothResults(rolledValue: 6),
              diceType: 'd6',
              icon: SVGIcon.d2_1)
        ],
        isFavourite: null);

    List<String> parts = item.id.split('-');

    expect(parts[0], 'roll');
    expect(parts[1].length, 16);
  });
}

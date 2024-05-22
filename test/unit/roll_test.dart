import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = RollEntryItem(
        // isFavourite: false,
        result: [DiceRoll(result: BothResults(rolledValue: 6), diceType: 'd6')],
        isFavourite: null);

    List<String> parts = item.id.split('-');

    expect(parts[0], 'roll');
    expect(parts[1].length, 16);
  });
}

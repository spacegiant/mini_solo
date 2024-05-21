import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = DiceRoll(
      // isFavourite: false,
      result: 3,
      diceType: 'd6',
    );

    List<String> parts = item.id.split('-');

    expect(parts[0], 'roll');
    expect(parts[1].length, 16);
  });
}

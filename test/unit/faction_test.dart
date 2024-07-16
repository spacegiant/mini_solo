import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/data_structures/faction.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final personItem = Faction(
      isFavourite: false,
      detail: 'Detail here',
      name: 'New Faction',
    );

    List<String> parts = personItem.id.split('-');

    expect(parts[0], 'newFaction');
    expect(parts[1].length, 16);
  });
}

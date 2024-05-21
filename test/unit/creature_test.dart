import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final personItem = Creature(
      isFavourite: false,
      detail: 'Detail here',
      title: 'Creature title',
    );

    List<String> parts = personItem.id.split('-');

    expect(parts[0], 'newCreature');
    expect(parts[1].length, 16);
  });
}

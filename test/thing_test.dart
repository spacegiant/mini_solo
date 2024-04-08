import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final personItem = Thing(
      isFavourite: false,
      type: JournalEntryTypes.newThing,
      detail: 'Detail here',
      name: 'Thing name',
    );

    List<String> parts = personItem.id.split('-');

    expect(parts[0], 'newThing');
    expect(parts[1].length, 16);
  });
}

import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final personItem = Place(
      isFavourite: false,
      type: JournalEntryTypes.newPlace,
      detail: '',
      name: '',
    );

    List<String> parts = personItem.id.split('-');

    expect(parts[0], 'newPlace');
    expect(parts[1].length, 16);
  });
}

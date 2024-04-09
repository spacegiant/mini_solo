import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final personItem = Clue(
      isFavourite: false,
      type: JournalEntryTypes.newClue,
      description: 'Description here',
    );

    List<String> parts = personItem.id.split('-');

    expect(parts[0], 'newClue');
    expect(parts[1].length, 16);
  });
}

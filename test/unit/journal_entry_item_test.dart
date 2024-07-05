import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/journal_entry_types.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = JournalEntryItem(
      isFavourite: false,
      type: JournalEntryTypes.chaosFactor,
      id: 'chaosFactor-1234567890123456',
    );

    List<String> parts = item.id.split('-');

    expect(parts[0], 'chaosFactor');
    expect(parts[1].length, 16);
  });
}

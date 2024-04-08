import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/generic_entry_item.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final genericEntryItem = GenericEntryItem(
      isFavourite: false,
      type: JournalEntryTypes.chaosFactor,
      title: 'Title',
    );

    // String id = genericEntryItem.id;
    List<String> parts = genericEntryItem.id.split('-');

    expect(parts[0], 'chaosFactor');
    expect(parts[1].length, 16);
  });
}

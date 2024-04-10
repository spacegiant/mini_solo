import 'package:mini_solo/data/generic_entry_item.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final genericEntryItem = GenericEntryItem(
      isFavourite: false,
      title: 'Title',
    );

    List<String> parts = genericEntryItem.id.split('-');

    expect(parts[0], 'dialogue');
    expect(parts[1].length, 16);
  });
}

import 'package:mini_solo/data/note_entry_item.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final noteEntryItem = NoteEntryItem(
      isFavourite: false,
      detail: 'Detail goes here',
    );

    List<String> parts = noteEntryItem.id.split('-');

    expect(parts[0], 'note');
    expect(parts[1].length, 16);
  });
}

import 'package:mini_solo/data/note_entry_item.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = NoteEntryItem(
      isFavourite: false,
      detail: 'Note goes here',
    );

    List<String> parts = item.id.split('-');

    expect(parts[0], 'note');
    expect(parts[1].length, 16);
  });
}

import 'package:mini_solo/data/data_structures/journal_entry.dart';
import 'package:mini_solo/data/data_structures/mythic_entry.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = MythicEntry(
      isFavourite: false,
      lines: JournalEntry(
        type: 'mythic',
        line1: 'line 1',
        line2: 'line 2',
        result: 'line 3',
      ),
      label: 'Label goes here',
    );

    List<String> parts = item.id.split('-');

    expect(parts[0], 'mythic');
    expect(parts[1].length, 16);
  });
}

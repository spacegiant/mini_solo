import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/data_structures/journal_entry.dart';
import 'package:mini_solo/data/data_structures/oracle_entry.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = OracleEntry(
      isFavourite: false,
      lines: JournalEntry(
        type: 'mythic',
        line1: 'line 1',
        line2: 'line 2',
        result: 'line 3',
      ),
      label: 'Test label',
    );

    List<String> parts = item.id.split('-');

    expect(parts[0], 'oracle');
    expect(parts[1].length, 16);
  });
}

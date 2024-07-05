import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/journal_entry_types.dart';
import 'package:mini_solo/utilities/id_generator.dart';
import 'package:test/test.dart';

void main() {
  test('Generates an ID as expected', () {
    final id = idGenerator(JournalEntryTypes.chaosFactor);

    List<String> parts = id.split('-');

    expect(parts[0], 'chaosFactor');
    expect(parts[1].length, 16);
  });
}

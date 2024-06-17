import 'package:mini_solo/data/app_settings_data.dart';
import 'package:test/test.dart';

void main() {
  test('Create initAppSettingsData initialises correctly', () {
    AppSettingsData data = initAppSettingsData();

    expect(data.currentCampaign, '');
    expect(data.randomTables.length, 0);
  });

  test('RandomTableEntry has correct data', () {
    RandomTableEntry randomTableEntry = RandomTableEntry(
      isFavourite: true,
      title: 'test title',
      rows: [
        RandomTableRow(label: 'test random table row 1'),
        RandomTableRow(label: 'test random table row 2'),
        RandomTableRow(label: 'test random table row 3'),
      ],
    );

    expect(randomTableEntry.isFavourite, true);
    expect(randomTableEntry.title, 'test title');
    expect(randomTableEntry.rows.length, 3);
    expect(randomTableEntry.rows[2].label, 'test random table row 3');
  });

  test('RollTableResult has correct data', () {
    RollTableResult rollTableResult = RollTableResult(
      weight: 10,
      isFavourite: true,
      title: 'Table Result Title 1',
      randomRoll: 11,
      resultString: 'Result String 1',
      totalEntries: 11,
    );

    expect(rollTableResult.weight, 10);
    expect(rollTableResult.isFavourite, true);
    expect(rollTableResult.title, 'Table Result Title 1');
    expect(rollTableResult.randomRoll, 11);
    expect(rollTableResult.resultString, 'Result String 1');
    expect(rollTableResult.totalEntries, 11);
  });
}

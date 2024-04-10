import 'package:mini_solo/data/campaign_data.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final item = OracleEntry(
      isFavourite: false,
      lines: ReturnObject(
        type: 'mythic',
        line1: 'line 1',
        line2: 'line 2',
        line3: 'line 3',
      ),
    );

    List<String> parts = item.id.split('-');

    expect(parts[0], 'oracleEntry');
    expect(parts[1].length, 16);
  });
}

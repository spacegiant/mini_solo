import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/data_structures/person.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final personItem = Person(
      isFavourite: false,
      firstName: 'Agnes',
      familyName: 'Asquith',
      detail: '',
    );

    List<String> parts = personItem.id.split('-');

    expect(parts[0], 'newPerson');
    expect(parts[1].length, 16);
  });
}

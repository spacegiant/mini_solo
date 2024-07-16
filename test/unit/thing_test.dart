import 'package:mini_solo/data/data_structures/thing.dart';
import 'package:test/test.dart';

void main() {
  test('Class generates a unique ID as expected', () {
    final personItem = Thing(
      isFavourite: false,
      detail: 'Detail here',
      name: 'Thing name',
    );

    List<String> parts = personItem.id.split('-');

    expect(parts[0], 'newThing');
    expect(parts[1].length, 16);
  });
}

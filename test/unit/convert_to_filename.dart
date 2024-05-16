import 'package:mini_solo/utilities/string/convert_to_filename.dart';
import 'package:test/test.dart';

void main() {
  test('Removes duplicated spaces from string', () {
    final despacedString = convertToFilename('  abc  def    ghi  ');
    expect(despacedString, 'abc_def_ghi');
  });
}

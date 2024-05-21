import 'package:mini_solo/utilities/string/convert_to_filename.dart';
import 'package:test/test.dart';

void main() {
  test('Removes duplicated spaces from string', () {
    String filename = convertToFilename('  !@£abc  def    ghi  ');
    expect(filename, 'abc_def_ghi');
  });
}

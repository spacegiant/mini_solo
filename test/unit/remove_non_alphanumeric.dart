import 'package:mini_solo/utilities/string/remove_non_alphanumeric.dart';
import 'package:test/test.dart';

void main() {
  test('Generates an ID as expected', () {
    final convertedString = removeNonAlphaNumeric('ABCabc123^&*XYZ');
    expect(convertedString, 'ABCabc123XYZ');
  });
}

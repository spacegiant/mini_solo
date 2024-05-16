import 'package:mini_solo/utilities/string/remove_non_alphanumeric.dart';

String convertToFilename(String string) {
  return removeNonAlphaNumeric(string)
      .replaceAll(RegExp(' +'), ' ')
      .trim()
      .replaceAll(' ', '_');
}

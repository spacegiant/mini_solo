// Source: https://stackoverflow.com/questions/15548652/how-to-generate-unique-id-in-dart
String idGenerator(String type) {
  final now = DateTime.now();
  return type + now.microsecondsSinceEpoch.toString();
}

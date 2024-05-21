String removeNonAlphaNumeric(String string) {
  // Remove extra spaces
  // split in to separate words
  String simpleString = string.replaceAll(RegExp(r'[^\w\s_]+'), '');
  //
  return simpleString;
}

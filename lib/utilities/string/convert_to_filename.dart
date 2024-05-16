String convertToFilename(String string) {
  String singleSpaceString = string.replaceAll(RegExp(' +'), ' ');
  singleSpaceString = singleSpaceString.trim();
  return singleSpaceString.replaceAll(' ', '_');
}

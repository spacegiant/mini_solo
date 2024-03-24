List<String> purifyStringList(List<String?> list) {
  // Source: https://stackoverflow.com/a/67657931
  list.removeWhere((element) => element == null);
  return List<String>.from(list);
}

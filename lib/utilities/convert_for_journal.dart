String convertToJournalEntry(
  String line1,
  String? line2,
  String? line3,
) {
  // For Journal
  String printLine2 = line2 != null ? ' $line2' : '';
  String printLine3 = line3 != null ? ' $line3' : '';

  return '$line1$printLine2$printLine3';
}

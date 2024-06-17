// Source: https://stackoverflow.com/questions/15548652/how-to-generate-unique-id-in-dart
import '../data/campaign_data.dart';

String idGenerator(JournalEntryTypes type) {
  final now = DateTime.now();
  return '${journalEntryTypeLabel[type]?.identifier}-${now.microsecondsSinceEpoch}';
}

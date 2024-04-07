import '../views/journal_view.dart';
import 'app_state.dart';
import 'campaign_data.dart';
import 'convert_for_journal.dart';

updateJournal(AppState appState, ReturnObject result, String label) {
  appState.addJournalEntry(JournalEntryItem(
    isFavourite: false,
    title: convertToJournalEntry(
      result.line1,
      result.line2,
      null,
    ),
    type: JournalEntryTypes.oracle,
    label: label,
  ));
}

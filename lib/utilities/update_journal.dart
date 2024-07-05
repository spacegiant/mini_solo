import '../data/app_state.dart';
import '../data/campaign_data.dart';
import '../data/journal_entry_types.dart';

updateJournal(AppState appState, JournalReturnObject result, String label) {
  appState.addJournalEntry(JournalEntryItem(
    isFavourite: false,
    type: JournalEntryTypes.oracle,
    id: '',
  ));
}

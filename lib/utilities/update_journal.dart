import '../data/app_state.dart';
import '../data/campaign_data.dart';

updateJournal(AppState appState, JournalReturnObject result, String label) {
  appState.addJournalEntry(JournalEntryItem(
    isFavourite: false,
    type: JournalEntryTypes.oracle,
    id: '',
  ));
}

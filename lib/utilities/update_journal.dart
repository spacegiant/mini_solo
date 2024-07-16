import '../data/app_state.dart';
import '../data/data_structures/journal_entry.dart';
import '../data/data_structures/journal_entry_item.dart';
import '../data/journal_entry_types.dart';

updateJournal(AppState appState, JournalEntry result, String label) {
  appState.addJournalEntry(JournalEntryItem(
    isFavourite: false,
    type: JournalEntryTypes.oracle,
    id: '',
  ));
}

import '../data/app_state.dart';
import '../data/campaign_data.dart';

updateJournal(AppState appState, ReturnObject result, String label) {
  appState.addJournalEntry(JournalEntryItem(
    isFavourite: false,
    // title: convertToJournalEntry(
    //   result.line1,
    //   result.line2,
    //   null,
    // ),
    type: JournalEntryTypes.oracle,
    // label: label,
    id: '',
  ));
}

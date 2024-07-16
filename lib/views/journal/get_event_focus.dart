import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../data/data_structures/mythic_entry.dart';
import '../../utilities/get_weighted_result.dart';

getEventFocus(AppState appState, [Function(String)? handleState]) {
  getWeightedResult('lib/assets/json/mythic.json', (String text) {
    if (handleState != null) handleState(text);

    //  Save to campaign data and push to journal
    appState.addMythicEntry(
      MythicEntry(
        isFavourite: false,
        lines: JournalEntry(
          result: text,
          type: 'mythic',
        ),
        label: 'Mythic Event Focus',
      ),
    );
  });
}

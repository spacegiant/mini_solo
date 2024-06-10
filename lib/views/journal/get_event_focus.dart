import '../../data/app_state.dart';
import '../../data/campaign_data.dart';
import '../../utilities/get_weighted_result.dart';

getEventFocus(AppState appState, Function(String) handleState) {
  getWeightedResult('lib/assets/json/mythic.json', (String text) {
    handleState(text);

    //  Save to campaign data and push to journal
    appState.addMythicEntry(
      MythicEntry(
        isFavourite: false,
        lines: JournalReturnObject(
          result: text,
          type: 'mythic',
        ),
        label: 'Mythic Event Focus',
      ),
    );
  });
}

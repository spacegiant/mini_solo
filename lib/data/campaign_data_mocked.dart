import 'campaign_data.dart';

CampaignData initCampaignDataData2() {
  return CampaignData(
    name: 'Shadows over Umber Keep',
    settings: SettingsData(
      general: GeneralSettingsData(
        showFutureSettings: false,
        useJournal: true,
        useZocchiDice: false,
      ),
    ),
    mythic: Mythic(
      chaosFactor: 5,
    ),
    journal: [
      // FIXME: Add matching ids
      JournalEntryItem(
          isFavourite: false, type: JournalEntryTypes.newScene, id: ''),
      JournalEntryItem(
          isFavourite: false, type: JournalEntryTypes.action, id: ''),
      JournalEntryItem(
          isFavourite: false, type: JournalEntryTypes.roll, id: ''),
      JournalEntryItem(
          isFavourite: false, type: JournalEntryTypes.dialogue, id: '')
    ],
    people: [],
    places: [],
    things: [],
    factions: [],
    clues: [],
    creatures: [],
  );
}

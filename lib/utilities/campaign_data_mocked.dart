import 'campaign_data.dart';

CampaignData initCampaignDataData() {
  return CampaignData(
    name: 'Shadows over Umber Keep',
    settings: SettingsData(
      general: GeneralSettingsData(
        showFutureSettings: false,
        useJournal: true,
      ),
    ),
    mythic: Mythic(
      chaosFactor: 5,
    ),
    journal: [
      JournalEntryItem(
        isFavourite: false,
        type: JournalEntryTypes.newScene,
        title: 'At Umber Keep Gates',
        detail: 'Some guards eye us suspiciously',
      ),
      JournalEntryItem(
        isFavourite: false,
        type: JournalEntryTypes.action,
        title: 'Boggins tries to charm them',
      ),
      JournalEntryItem(
        isFavourite: false,
        title: 'd20 -> 16',
        type: JournalEntryTypes.roll,
      ),
      JournalEntryItem(
        isFavourite: false,
        title:
            'Success! You notice they eye up any passing jewelry with avarice.',
        type: JournalEntryTypes.gm,
      )
    ],
    people: [],
    places: [],
    things: [],
    factions: [],
    clues: [],
    creatures: [],
    dungeons: [],
  );
}

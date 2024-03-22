import 'campaign_data.dart';

CampaignData initCampaignDataData() {
  return CampaignData(
    name: 'Shadows over Umber Keep',
    mythic: Mythic(
      chaosFactor: 5,
    ),
    journal: [
      JournalEntry(
        isFavourite: false,
        type: JournalEntryTypes.newScene,
        title: 'At Umber Keep Gates',
        detail: 'Some guards eye us suspiciously',
      ),
      JournalEntry(
        isFavourite: false,
        type: JournalEntryTypes.action,
        title: 'Boggins tries to charm them',
      ),
      JournalEntry(
        isFavourite: false,
        title: 'd20 -> 16',
        type: JournalEntryTypes.roll,
      ),
      JournalEntry(
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

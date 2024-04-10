import 'campaign_data.dart';

CampaignData sampleCampaignData() {
  return CampaignData(
    name: 'Shadows over Umber Keep',
    settings: SettingsData(
      general: GeneralSettingsData(
        showFutureSettings: false,
        useJournal: true,
        useZocchiDice: false,
      ),
    ),
    mythicData: MythicData(
      chaosFactor: 5,
    ),
    journal: [
      // FIXME: Add matching ids
    ],
    people: [],
    places: [],
    things: [],
    factions: [],
    clues: [],
    creatures: [],
    rolls: [],
    generic: [],
    oracle: [],
    mythic: [],
    dialogue: [],
  );
}

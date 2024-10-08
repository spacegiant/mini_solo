import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/initialise_groups.dart';
import 'package:mini_solo/data/result_entries.dart';
import 'package:mini_solo/utilities/string/convert_to_filename.dart';
import '../features/grouping/group.dart';
import '../features/kard/kard.dart';
import 'app_settings_data.dart';
import 'data_structures/clue.dart';
import 'data_structures/creature.dart';
import 'data_structures/faction.dart';
import 'data_structures/journal_entry_item.dart';
import 'data_structures/mythic_data.dart';
import 'data_structures/mythic_entry.dart';
import 'data_structures/new_scene_entry.dart';
import 'data_structures/oracle_entry.dart';
import 'data_structures/person.dart';
import 'data_structures/place.dart';
import 'data_structures/roll_entry_item.dart';
import 'data_structures/scratch_page_entry_item.dart';
import 'data_structures/thing.dart';
import 'data_structures/tracker_entry.dart';
import 'journal_entry_types.dart';
import 'note_entry_item.dart';

part 'campaign_data.g.dart';

// NOTE: Run `dart run build_runner build` to regenerate files

enum ControlTypes {
  clock4,
  clock6,
  clock8,
  bar,
  ironsworn1Troublesome,
  ironsworn2Dangerous,
  ironsworn3Formidable,
  ironsworn4Extreme,
  ironsworn5Epic,
  pips,
  value,
  counter,
  fate_aspect,
}

// set to true if you have nested Model classes
@JsonSerializable(explicitToJson: true)
class SettingsData {
  late GeneralSettingsData general;

  SettingsData({required this.general});

  // coverage:ignore-start
  factory SettingsData.fromJson(Map<String, dynamic> json) =>
      _$SettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsDataToJson(this);
// coverage:ignore-end
}

@JsonSerializable()
class GeneralSettingsData {
  late bool showNotes;
  late bool showFutureSettings;
  late bool diceActive;
  late bool showMechanics;
  late bool useJournal;
  late bool useZocchiDice;
  late bool useRegularDice;
  late bool useFateDice;
  late bool useCoriolisDice;
  late bool useT2KDice;
  late bool useAchtungCthulhuDice;
  late bool useD6Oracle;
  late bool wrapDiceControls;
  late List<JournalEntryTypes> hiddenEntryTypes;
  late int randomTableRecursionLimit;

  GeneralSettingsData({
    required this.showNotes,
    required this.showFutureSettings,
    required this.diceActive,
    required this.showMechanics,
    required this.useJournal,
    required this.useRegularDice,
    required this.useZocchiDice,
    required this.useFateDice,
    required this.useCoriolisDice,
    required this.useT2KDice,
    required this.useAchtungCthulhuDice,
    required this.useD6Oracle,
    required this.wrapDiceControls,
    required this.hiddenEntryTypes,
    required this.randomTableRecursionLimit,
  });
// coverage:ignore-start
  factory GeneralSettingsData.fromJson(Map<String, dynamic> json) =>
      _$GeneralSettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralSettingsDataToJson(this);
  // coverage:ignore-end
}

// set to true if you have nested Model classes
@JsonSerializable(explicitToJson: true)
class CampaignData {
  late SettingsData settings;
  late String name;
  late String currentScratchEntryId;
  late String filename;
  late MythicData mythicData;
  late List<MythicEntry> mythic;
  late List<JournalEntryItem> journal;
  late List<NoteEntryItem> notes;
  late List<OracleEntry> oracle;
  late List<Person> people;
  late List<Place> places;
  late List<Thing> things;
  late List<Faction> factions;
  late List<Clue> clues;
  late List<Creature> creatures;
  late List<RollEntryItem> rolls;
  late List<ScratchPageEntryItem> scratchPad;
  late List<RollTableResults> rollTableResults;
  late List<TrackerEntry> tracker;
  late List<NewSceneEntry> newScene;
  late List<Group> groups;
  late List<Kard> kards;
  late List<ResultEntriesCollection> resultEntries;

  CampaignData({
    required this.settings,
    required this.name,
    required this.currentScratchEntryId,
    required this.filename,
    required this.mythic,
    required this.mythicData,
    required this.oracle,
    required this.journal,
    required this.notes,
    required this.people,
    required this.places,
    required this.things,
    required this.factions,
    required this.clues,
    required this.creatures,
    required this.rolls,
    required this.scratchPad,
    required this.rollTableResults,
    required this.tracker,
    required this.newScene,
    required this.groups,
    required this.kards,
    required this.resultEntries,
  });

  // coverage:ignore-start
  factory CampaignData.fromJson(Map<String, dynamic> json) =>
      _$CampaignDataFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignDataToJson(this);
// coverage:ignore-end
}

// TODO: Replace with better name than initCampaignDataData
CampaignData baseCampaignData(String campaignName) {
  return CampaignData(
    clues: [],
    creatures: [],
    currentScratchEntryId: '',
    factions: [],
    notes: [],
    journal: [],
    mythic: [],
    mythicData: MythicData(
      chaosFactor: 5,
    ),
    name: campaignName,
    filename: convertToFilename(campaignName),
    oracle: [],
    people: [],
    places: [],
    rolls: [],
    scratchPad: [],
    settings: SettingsData(
      general: GeneralSettingsData(
        showNotes: true,
        showFutureSettings: false,
        showMechanics: true,
        useJournal: true,
        useRegularDice: true,
        useZocchiDice: false,
        useFateDice: false,
        useCoriolisDice: false,
        useT2KDice: false,
        useAchtungCthulhuDice: false,
        useD6Oracle: false,
        wrapDiceControls: false,
        hiddenEntryTypes: [
          JournalEntryTypes.tracker,
        ],
        diceActive: true,
        randomTableRecursionLimit: 3,
      ),
    ),
    things: [],
    rollTableResults: [],
    tracker: [],
    newScene: [],
    kards: [],
    // TODO take a copy of groups for app settings data. Use this when creating a new campaign, so random tables etc are in groups rather than defaulting to unsorted.
    groups: initialiseGroups,
    resultEntries: [],
  );
}

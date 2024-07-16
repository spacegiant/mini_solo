import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/data/initialise_groups.dart';
import 'package:mini_solo/data/result_entries.dart';
import 'package:mini_solo/utilities/string/convert_to_filename.dart';
import '../features/grouping/group.dart';
import '../features/kard/kard.dart';
import '../svg_icon.dart';
import '../views/journal/chooseControlWidget.dart';
import '../views/journal/control_data.dart';
import 'app_settings_data.dart';
import 'campaign_item.dart';
import 'data_structures/mythic_entry.dart';
import 'data_structures/new_scene_entry.dart';
import 'data_structures/oracle_entry.dart';
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

@JsonSerializable()
class JournalEntry {
  late String type;
  late String? line1;
  late String? line2;
  late String result;

  JournalEntry({
    required this.type,
    this.line1,
    this.line2,
    required this.result,
  });

  // coverage:ignore-start
  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);

  Map<String, dynamic> toJson() => _$JournalEntryToJson(this);
// coverage:ignore-end
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
  late List<ResultEntries> resultEntries;

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

@JsonSerializable()
class MythicData {
  int chaosFactor;

  MythicData({
    required this.chaosFactor,
  });

  // coverage:ignore-start
  factory MythicData.fromJson(Map<String, dynamic> json) =>
      _$MythicDataFromJson(json);

  Map<String, dynamic> toJson() => _$MythicDataToJson(this);
// coverage:ignore-end
}

@JsonSerializable(explicitToJson: true)
class JournalEntryItem {
  bool isFavourite;
  JournalEntryTypes type;
  String id;

  JournalEntryItem({
    required this.isFavourite,
    required this.type,
    required this.id,
  });

  // coverage:ignore-start
  factory JournalEntryItem.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$JournalEntryItemToJson(this);
// coverage:ignore-end
}

@JsonSerializable()
class Person extends CampaignItem {
  String firstName;
  String familyName;
  String? detail;

  Person({
    required super.isFavourite,
    required this.firstName,
    required this.familyName,
    this.detail,
  });
  // coverage:ignore-start
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.newPerson;
// coverage:ignore-end
}

@JsonSerializable()
class Place extends CampaignItem {
  String name;
  String? detail;
  Place? parent;

  Place({
    required super.isFavourite,
    required this.name,
    this.detail,
    this.parent,
  });

  // coverage:ignore-start
  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.newPlace;
// coverage:ignore-end
}

@JsonSerializable()
class Thing extends CampaignItem {
  String name;
  Person? owner;
  String? detail;

  Thing({
    required super.isFavourite,
    required this.name,
    this.owner,
    this.detail,
  });

  @override
  JournalEntryTypes type = JournalEntryTypes.newThing;

  // coverage:ignore-start
  factory Thing.fromJson(Map<String, dynamic> json) => _$ThingFromJson(json);

  Map<String, dynamic> toJson() => _$ThingToJson(this);
  // coverage:ignore-end
}

@JsonSerializable()
class Faction extends CampaignItem {
  String name;
  String? occupation;
  String? detail;

  Faction({
    required super.isFavourite,
    required this.name,
    this.occupation,
    this.detail,
  });

  // coverage:ignore-start
  factory Faction.fromJson(Map<String, dynamic> json) =>
      _$FactionFromJson(json);

  Map<String, dynamic> toJson() => _$FactionToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.newFaction;
// coverage:ignore-end
}

@JsonSerializable()
class Clue extends CampaignItem {
  String description;
  String? notes;

  Clue({
    required super.isFavourite,
    required this.description,
    this.notes,
  });

  // coverage:ignore-start
  factory Clue.fromJson(Map<String, dynamic> json) => _$ClueFromJson(json);

  Map<String, dynamic> toJson() => _$ClueToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.newClue;
// coverage:ignore-end
}

@JsonSerializable()
class Creature extends CampaignItem {
  String title;
  String? detail;

  Creature({
    required super.isFavourite,
    required this.title,
    this.detail,
  });

  // coverage:ignore-start
  factory Creature.fromJson(Map<String, dynamic> json) =>
      _$CreatureFromJson(json);

  Map<String, dynamic> toJson() => _$CreatureToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.newCreature;
// coverage:ignore-end
}

@JsonSerializable()
class BothResults {
  final int rolledValue;
  final String? label;

  BothResults({
    required this.rolledValue,
    this.label,
  });

  // coverage:ignore-start
  factory BothResults.fromJson(Map<String, dynamic> json) =>
      _$BothResultsFromJson(json);

  Map<String, dynamic> toJson() => _$BothResultsToJson(this);

// coverage:ignore-end
}

@JsonSerializable()
class DiceRoll {
  BothResults result;
  String diceType;
  SVGIcon icon;

  DiceRoll({
    // required super.isFavourite,
    required this.result,
    required this.diceType,
    required this.icon,
  });
// coverage:ignore-start
  factory DiceRoll.fromJson(Map<String, dynamic> json) =>
      _$DiceRollFromJson(json);

  Map<String, dynamic> toJson() => _$DiceRollToJson(this);

// coverage:ignore-end
}

@JsonSerializable()
class ScratchPageEntryItem extends CampaignItem {
  String title;
  String text;
  DateTime dateCreated;

  ScratchPageEntryItem({
    required super.isFavourite,
    required this.title,
    required this.text,
    required this.dateCreated,
  });
// coverage:ignore-start
  factory ScratchPageEntryItem.fromJson(Map<String, dynamic> json) =>
      _$ScratchPageEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$ScratchPageEntryItemToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.scratchPage;
// coverage:ignore-end
}

@JsonSerializable()
class RollEntryItem extends CampaignItem {
  List<DiceRoll> result;
  String label;
  SVGIcon? icon;

  RollEntryItem({
    required super.isFavourite,
    required this.result,
    this.label = 'Dice Roll',
    this.icon,
  });
// coverage:ignore-start
  factory RollEntryItem.fromJson(Map<String, dynamic> json) =>
      _$RollEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$RollEntryItemToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.roll;
// coverage:ignore-end
}

List<ControlData> initialMythicGMEControls = [
  ControlData(
      controlId: 'mythic-new-scene',
      label: 'New Scene',
      controlType: ControlTypeEnum.newScene),
  ControlData(
      controlId: 'mythic-expected-scene',
      label: 'Test Expected Scene',
      controlType: ControlTypeEnum.mythicExpectedScene),
  ControlData(
      controlId: 'mythic-action',
      label: 'Mythic Action',
      controlType: ControlTypeEnum.mythicAction),
  ControlData(
      controlId: 'mythic-description',
      label: 'Mythic Description',
      controlType: ControlTypeEnum.mythicDescription),
  ControlData(
      controlId: 'mythic-event-focus',
      label: 'Mythic Event Focus',
      controlType: ControlTypeEnum.mythicEventFocus),
  ControlData(
      controlId: 'mythic-plot-twist',
      label: 'Mythic Plot Twist',
      controlType: ControlTypeEnum.mythicPlotTwist),
];

List<String> initialMythicGMEIds = [
  for (var control in initialMythicGMEControls) control.controlId
];

import 'package:json_annotation/json_annotation.dart';
import 'package:mini_solo/utilities/string/convert_to_filename.dart';
import 'package:mini_solo/views/dice/dice.dart';
import 'campaign_item.dart';
import 'generic_entry_item.dart';

part 'campaign_data.g.dart';

// NOTE: Run `dart run build_runner build` to regenerate files

// TODO: Set up so that each type has different data shape
enum JournalEntryTypes {
  action,
  chaosFactor,
  dialogue,
  fateCheck,
  mythic,
  newClue,
  newCreature,
  newEntity,
  newFaction,
  newPerson,
  newPlace,
  newScene,
  newThing,
  note,
  oracle,
  outcome,
  roll,
  transition,
}

Map<JournalEntryTypes, String> journalEntryTypeLabel = {
  // JournalEntryTypes.action: 'action',
  JournalEntryTypes.chaosFactor: 'chaosFactor',
  JournalEntryTypes.dialogue: 'dialogue',
  // JournalEntryTypes.fateCheck: 'fateCheck',
  JournalEntryTypes.mythic: 'mythic',
  JournalEntryTypes.newClue: 'newClue',
  JournalEntryTypes.newCreature: 'newCreature',
  JournalEntryTypes.newEntity: 'newEntity',
  JournalEntryTypes.newFaction: 'newFaction',
  JournalEntryTypes.newPerson: 'newPerson',
  JournalEntryTypes.newPlace: 'newPlace',
  JournalEntryTypes.newScene: 'newScene',
  JournalEntryTypes.newThing: 'newThing',
  JournalEntryTypes.note: 'note',
  JournalEntryTypes.oracle: 'oracle',
  // JournalEntryTypes.outcome: 'outcome',
  JournalEntryTypes.roll: 'roll',
  JournalEntryTypes.transition: 'transition',
};

// TODO: Rename this
@JsonSerializable()
class ReturnObject {
  late String type;
  late String line1;
  late String? line2;
  late String? line3;

  ReturnObject({
    required this.type,
    required this.line1,
    this.line2,
    this.line3,
  });

  // coverage:ignore-start
  factory ReturnObject.fromJson(Map<String, dynamic> json) =>
      _$ReturnObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnObjectToJson(this);
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
  // TODO: Make showFutureSettings private
  late bool showFutureSettings;
  late bool useJournal;
  late bool useZocchiDice;
  late bool useFateDice;

  GeneralSettingsData({
    required this.showFutureSettings,
    required this.useJournal,
    required this.useZocchiDice,
    required this.useFateDice,
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
  late String filename;
  late MythicData mythicData;
  late List<MythicEntry> mythic;
  late List<JournalEntryItem> journal;
  late List<GenericEntryItem> generic;
  late List<OracleEntry> oracle;
  late List<Person> people;
  late List<Place> places;
  late List<Thing> things;
  late List<Faction> factions;
  late List<Clue> clues;
  late List<Creature> creatures;
  late List<Dialogue> dialogue;
  late List<RollEntryItem> rolls;
  // late List<Dialogue> dialogue;

  CampaignData({
    required this.settings,
    required this.name,
    required this.filename,
    required this.mythic,
    required this.mythicData,
    required this.oracle,
    required this.journal,
    required this.generic,
    required this.people,
    required this.places,
    required this.things,
    required this.factions,
    required this.clues,
    required this.creatures,
    required this.dialogue,
    required this.rolls,
    // required this.dialogue,
  });

  // coverage:ignore-start
  factory CampaignData.fromJson(Map<String, dynamic> json) =>
      _$CampaignDataFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignDataToJson(this);
// coverage:ignore-end
}

// TODO: Replace with better name than initCampaignDataData
CampaignData initCampaignDataData(String campaignName) {
  return CampaignData(
    clues: [],
    creatures: [],
    dialogue: [],
    factions: [],
    generic: [],
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
    settings: SettingsData(
      general: GeneralSettingsData(
        showFutureSettings: false,
        useJournal: true,
        useZocchiDice: false,
        useFateDice: false,
      ),
    ),
    things: [],
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

  // coverage:ignore-start
  factory Thing.fromJson(Map<String, dynamic> json) => _$ThingFromJson(json);

  Map<String, dynamic> toJson() => _$ThingToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.newThing;
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

  DiceRoll({
    // required super.isFavourite,
    required this.result,
    required this.diceType,
  });
// coverage:ignore-start
  factory DiceRoll.fromJson(Map<String, dynamic> json) =>
      _$DiceRollFromJson(json);

  Map<String, dynamic> toJson() => _$DiceRollToJson(this);

// coverage:ignore-end
}

@JsonSerializable()
class RollEntryItem extends CampaignItem {
  List<DiceRoll> result;

  RollEntryItem({
    required super.isFavourite,
    required this.result,
  });
// coverage:ignore-start
  factory RollEntryItem.fromJson(Map<String, dynamic> json) =>
      _$RollEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$RollEntryItemToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.roll;
// coverage:ignore-end
}

@JsonSerializable()
class Note extends CampaignItem {
  String note;

  Note({
    required super.isFavourite,
    required this.note,
  });
// coverage:ignore-start
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.note;
// coverage:ignore-end
}

@JsonSerializable()
class OracleEntry extends CampaignItem {
  ReturnObject lines;

  OracleEntry({
    required super.isFavourite,
    required this.lines,
  });
// coverage:ignore-start
  factory OracleEntry.fromJson(Map<String, dynamic> json) =>
      _$OracleEntryFromJson(json);

  Map<String, dynamic> toJson() => _$OracleEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.oracle;
// coverage:ignore-end
}

@JsonSerializable()
class MythicEntry extends CampaignItem {
  ReturnObject lines;

  MythicEntry({
    required super.isFavourite,
    required this.lines,
  });
// coverage:ignore-start
  factory MythicEntry.fromJson(Map<String, dynamic> json) =>
      _$MythicEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MythicEntryToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.mythic;
// coverage:ignore-end
}

@JsonSerializable()
class Dialogue extends CampaignItem {
  String dialogue;
  String speaker;

  Dialogue({
    required super.isFavourite,
    required this.dialogue,
    required this.speaker,
  });
// coverage:ignore-start
  factory Dialogue.fromJson(Map<String, dynamic> json) =>
      _$DialogueFromJson(json);

  Map<String, dynamic> toJson() => _$DialogueToJson(this);

  @override
  JournalEntryTypes type = JournalEntryTypes.dialogue;
// coverage:ignore-end
}

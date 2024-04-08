import 'package:json_annotation/json_annotation.dart';
import 'campaign_item.dart';
import 'generic_entry_item.dart';

part 'campaign_data.g.dart';

// NOTE: Run `dart run build_runner build` to regenerate files

// TODO: Set up so that each type has different data shape
enum JournalEntryTypes {
  oracle,
  roll,
  action,
  outcome,
  fateCheck,
  newScene,
  newEntity,
  gm,
  pc,
  npc,
  transition,
  chaosFactor,
}

Map<JournalEntryTypes, String> journalEntryTypeLabel = {
  JournalEntryTypes.oracle: 'oracle',
  JournalEntryTypes.roll: 'roll',
  JournalEntryTypes.action: 'action',
  JournalEntryTypes.outcome: 'outcome',
  JournalEntryTypes.fateCheck: 'fateCheck',
  JournalEntryTypes.newScene: 'newScene',
  JournalEntryTypes.newEntity: 'newEntity',
  JournalEntryTypes.gm: 'gm',
  JournalEntryTypes.pc: 'pc',
  JournalEntryTypes.npc: 'npc',
  JournalEntryTypes.transition: 'transition',
  JournalEntryTypes.chaosFactor: 'chaosFactor',
};

// set to true if you have nested Model classes
@JsonSerializable(explicitToJson: true)
class SettingsData {
  late GeneralSettingsData general;

  SettingsData({required this.general});

  factory SettingsData.fromJson(Map<String, dynamic> json) =>
      _$SettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsDataToJson(this);
}

@JsonSerializable()
class GeneralSettingsData {
  late bool showFutureSettings;
  late bool useJournal;
  late bool useZocchiDice;

  GeneralSettingsData({
    required this.showFutureSettings,
    required this.useJournal,
    required this.useZocchiDice,
  });

  factory GeneralSettingsData.fromJson(Map<String, dynamic> json) =>
      _$GeneralSettingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralSettingsDataToJson(this);
}

// set to true if you have nested Model classes
@JsonSerializable(explicitToJson: true)
class CampaignData {
  late SettingsData settings;
  late String name;
  late Mythic mythic;
  late List<JournalEntryItem> journal;
  late List<GenericEntryItem> generic;
  late List<Person> people;
  late List<Place> places;
  late List<Thing> things;
  late List<Faction> factions;
  late List<Clue> clues;
  late List<Creature> creatures;
  late List<Dungeon> dungeons;

  CampaignData({
    required this.settings,
    required this.name,
    required this.mythic,
    required this.journal,
    required this.people,
    required this.places,
    required this.things,
    required this.factions,
    required this.clues,
    required this.creatures,
    required this.dungeons,
  });

  factory CampaignData.fromJson(Map<String, dynamic> json) =>
      _$CampaignDataFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignDataToJson(this);
}

CampaignData initCampaignDataData(String campaignName) {
  return CampaignData(
    name: campaignName,
    mythic: Mythic(
      chaosFactor: 5,
    ),
    journal: [],
    people: [],
    places: [],
    things: [],
    factions: [],
    clues: [],
    creatures: [],
    dungeons: [],
    settings: SettingsData(
      general: GeneralSettingsData(
        showFutureSettings: false,
        useJournal: true,
        useZocchiDice: false,
      ),
    ),
  );
}

@JsonSerializable()
class Mythic {
  int chaosFactor;

  Mythic({
    required this.chaosFactor,
  });

  factory Mythic.fromJson(Map<String, dynamic> json) => _$MythicFromJson(json);

  Map<String, dynamic> toJson() => _$MythicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JournalEntryItem extends CampaignItem {
  // late JournalEntryTypes type;

  JournalEntryItem({
    required super.isFavourite,
    required super.type,
    required super.id,
  });

  factory JournalEntryItem.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryItemFromJson(json);

  Map<String, dynamic> toJson() => _$JournalEntryItemToJson(this);
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
    required super.type,
    required super.id,
  });
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
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
    required super.type,
    required super.id,
  });

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
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
    required super.type,
    required super.id,
  });

  factory Thing.fromJson(Map<String, dynamic> json) => _$ThingFromJson(json);

  Map<String, dynamic> toJson() => _$ThingToJson(this);
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
    required super.type,
    required super.id,
  });

  factory Faction.fromJson(Map<String, dynamic> json) =>
      _$FactionFromJson(json);

  Map<String, dynamic> toJson() => _$FactionToJson(this);
}

@JsonSerializable()
class Clue extends CampaignItem {
  String description;
  String? notes;

  Clue({
    required super.isFavourite,
    required this.description,
    this.notes,
    required super.type,
    required super.id,
  });

  factory Clue.fromJson(Map<String, dynamic> json) => _$ClueFromJson(json);

  Map<String, dynamic> toJson() => _$ClueToJson(this);
}

@JsonSerializable()
class Creature extends CampaignItem {
  String title;
  String? detail;

  Creature({
    required super.isFavourite,
    required this.title,
    this.detail,
    required super.type,
    required super.id,
  });

  factory Creature.fromJson(Map<String, dynamic> json) =>
      _$CreatureFromJson(json);

  Map<String, dynamic> toJson() => _$CreatureToJson(this);
}

@JsonSerializable()
class DungeonRoom {
  String name;
  String? detail;

  DungeonRoom({
    required this.name,
    this.detail,
  });

  factory DungeonRoom.fromJson(Map<String, dynamic> json) =>
      _$DungeonRoomFromJson(json);

  Map<String, dynamic> toJson() => _$DungeonRoomToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Dungeon extends CampaignItem {
  String title;
  List<DungeonRoom>? rooms;

  Dungeon({
    required super.isFavourite,
    required this.title,
    this.rooms,
    required super.type,
    required super.id,
  });

  factory Dungeon.fromJson(Map<String, dynamic> json) =>
      _$DungeonFromJson(json);

  Map<String, dynamic> toJson() => _$DungeonToJson(this);
}

@JsonSerializable()
class DiceResult {
  int result;
  String diceType;

  DiceResult({
    required this.result,
    required this.diceType,
  });

  factory DiceResult.fromJson(Map<String, dynamic> json) =>
      _$DiceResultFromJson(json);

  Map<String, dynamic> toJson() => _$DiceResultToJson(this);
}

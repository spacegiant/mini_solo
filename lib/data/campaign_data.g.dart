// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsData _$SettingsDataFromJson(Map<String, dynamic> json) => SettingsData(
      general:
          GeneralSettingsData.fromJson(json['general'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsDataToJson(SettingsData instance) =>
    <String, dynamic>{
      'general': instance.general.toJson(),
    };

GeneralSettingsData _$GeneralSettingsDataFromJson(Map<String, dynamic> json) =>
    GeneralSettingsData(
      showFutureSettings: json['showFutureSettings'] as bool,
      useJournal: json['useJournal'] as bool,
      useZocchiDice: json['useZocchiDice'] as bool,
    );

Map<String, dynamic> _$GeneralSettingsDataToJson(
        GeneralSettingsData instance) =>
    <String, dynamic>{
      'showFutureSettings': instance.showFutureSettings,
      'useJournal': instance.useJournal,
      'useZocchiDice': instance.useZocchiDice,
    };

CampaignData _$CampaignDataFromJson(Map<String, dynamic> json) => CampaignData(
      settings: SettingsData.fromJson(json['settings'] as Map<String, dynamic>),
      name: json['name'] as String,
      mythic: Mythic.fromJson(json['mythic'] as Map<String, dynamic>),
      journal: (json['journal'] as List<dynamic>)
          .map((e) => JournalEntryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      people: (json['people'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      places: (json['places'] as List<dynamic>)
          .map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
      things: (json['things'] as List<dynamic>)
          .map((e) => Thing.fromJson(e as Map<String, dynamic>))
          .toList(),
      factions: (json['factions'] as List<dynamic>)
          .map((e) => Faction.fromJson(e as Map<String, dynamic>))
          .toList(),
      clues: (json['clues'] as List<dynamic>)
          .map((e) => Clue.fromJson(e as Map<String, dynamic>))
          .toList(),
      creatures: (json['creatures'] as List<dynamic>)
          .map((e) => Creature.fromJson(e as Map<String, dynamic>))
          .toList(),
      rolls: (json['rolls'] as List<dynamic>)
          .map((e) => Roll.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..generic = (json['generic'] as List<dynamic>)
        .map((e) => GenericEntryItem.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$CampaignDataToJson(CampaignData instance) =>
    <String, dynamic>{
      'settings': instance.settings.toJson(),
      'name': instance.name,
      'mythic': instance.mythic.toJson(),
      'journal': instance.journal.map((e) => e.toJson()).toList(),
      'generic': instance.generic.map((e) => e.toJson()).toList(),
      'people': instance.people.map((e) => e.toJson()).toList(),
      'places': instance.places.map((e) => e.toJson()).toList(),
      'things': instance.things.map((e) => e.toJson()).toList(),
      'factions': instance.factions.map((e) => e.toJson()).toList(),
      'clues': instance.clues.map((e) => e.toJson()).toList(),
      'creatures': instance.creatures.map((e) => e.toJson()).toList(),
      'rolls': instance.rolls.map((e) => e.toJson()).toList(),
    };

Mythic _$MythicFromJson(Map<String, dynamic> json) => Mythic(
      chaosFactor: json['chaosFactor'] as int,
    );

Map<String, dynamic> _$MythicToJson(Mythic instance) => <String, dynamic>{
      'chaosFactor': instance.chaosFactor,
    };

JournalEntryItem _$JournalEntryItemFromJson(Map<String, dynamic> json) =>
    JournalEntryItem(
      isFavourite: json['isFavourite'] as bool,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
      id: json['id'] as String,
    );

Map<String, dynamic> _$JournalEntryItemToJson(JournalEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
    };

const _$JournalEntryTypesEnumMap = {
  JournalEntryTypes.oracle: 'oracle',
  JournalEntryTypes.roll: 'roll',
  JournalEntryTypes.action: 'action',
  JournalEntryTypes.outcome: 'outcome',
  JournalEntryTypes.fateCheck: 'fateCheck',
  JournalEntryTypes.newScene: 'newScene',
  JournalEntryTypes.newEntity: 'newEntity',
  JournalEntryTypes.transition: 'transition',
  JournalEntryTypes.chaosFactor: 'chaosFactor',
  JournalEntryTypes.newClue: 'newClue',
  JournalEntryTypes.newPerson: 'newPerson',
  JournalEntryTypes.newPlace: 'newPlace',
  JournalEntryTypes.newThing: 'newThing',
  JournalEntryTypes.newFaction: 'newFaction',
  JournalEntryTypes.dialogue: 'dialogue',
  JournalEntryTypes.newCreature: 'newCreature',
};

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      isFavourite: json['isFavourite'] as bool?,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
      firstName: json['firstName'] as String,
      familyName: json['familyName'] as String,
      detail: json['detail'] as String?,
    )..id = json['id'] as String;

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'firstName': instance.firstName,
      'familyName': instance.familyName,
      'detail': instance.detail,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      isFavourite: json['isFavourite'] as bool?,
      name: json['name'] as String,
      detail: json['detail'] as String?,
      parent: json['parent'] == null
          ? null
          : Place.fromJson(json['parent'] as Map<String, dynamic>),
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
    )..id = json['id'] as String;

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'detail': instance.detail,
      'parent': instance.parent,
    };

Thing _$ThingFromJson(Map<String, dynamic> json) => Thing(
      isFavourite: json['isFavourite'] as bool?,
      name: json['name'] as String,
      owner: json['owner'] == null
          ? null
          : Person.fromJson(json['owner'] as Map<String, dynamic>),
      detail: json['detail'] as String?,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
    )..id = json['id'] as String;

Map<String, dynamic> _$ThingToJson(Thing instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'detail': instance.detail,
    };

Faction _$FactionFromJson(Map<String, dynamic> json) => Faction(
      isFavourite: json['isFavourite'] as bool?,
      name: json['name'] as String,
      occupation: json['occupation'] as String?,
      detail: json['detail'] as String?,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
    )..id = json['id'] as String;

Map<String, dynamic> _$FactionToJson(Faction instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'occupation': instance.occupation,
      'detail': instance.detail,
    };

Clue _$ClueFromJson(Map<String, dynamic> json) => Clue(
      isFavourite: json['isFavourite'] as bool?,
      description: json['description'] as String,
      notes: json['notes'] as String?,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
    )..id = json['id'] as String;

Map<String, dynamic> _$ClueToJson(Clue instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'description': instance.description,
      'notes': instance.notes,
    };

Creature _$CreatureFromJson(Map<String, dynamic> json) => Creature(
      isFavourite: json['isFavourite'] as bool?,
      title: json['title'] as String,
      detail: json['detail'] as String?,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
    )..id = json['id'] as String;

Map<String, dynamic> _$CreatureToJson(Creature instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'title': instance.title,
      'detail': instance.detail,
    };

Roll _$RollFromJson(Map<String, dynamic> json) => Roll(
      isFavourite: json['isFavourite'] as bool?,
      result: json['result'] as int,
      diceType: json['diceType'] as String,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
    )..id = json['id'] as String;

Map<String, dynamic> _$RollToJson(Roll instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'result': instance.result,
      'diceType': instance.diceType,
    };

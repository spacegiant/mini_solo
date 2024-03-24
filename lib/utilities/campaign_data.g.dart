// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignData _$CampaignDataFromJson(Map<String, dynamic> json) => CampaignData(
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
      dungeons: (json['dungeons'] as List<dynamic>)
          .map((e) => Dungeon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CampaignDataToJson(CampaignData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mythic': instance.mythic.toJson(),
      'journal': instance.journal.map((e) => e.toJson()).toList(),
      'people': instance.people.map((e) => e.toJson()).toList(),
      'places': instance.places.map((e) => e.toJson()).toList(),
      'things': instance.things.map((e) => e.toJson()).toList(),
      'factions': instance.factions.map((e) => e.toJson()).toList(),
      'clues': instance.clues.map((e) => e.toJson()).toList(),
      'creatures': instance.creatures.map((e) => e.toJson()).toList(),
      'dungeons': instance.dungeons.map((e) => e.toJson()).toList(),
    };

Mythic _$MythicFromJson(Map<String, dynamic> json) => Mythic(
      chaosFactor: json['chaosFactor'] as int?,
    );

Map<String, dynamic> _$MythicToJson(Mythic instance) => <String, dynamic>{
      'chaosFactor': instance.chaosFactor,
    };

JournalEntryItem _$JournalEntryItemFromJson(Map<String, dynamic> json) =>
    JournalEntryItem(
      isFavourite: json['isFavourite'] as bool,
      title: json['title'] as String,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
      label: json['label'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$JournalEntryItemToJson(JournalEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'title': instance.title,
      'label': instance.label,
      'detail': instance.detail,
    };

const _$JournalEntryTypesEnumMap = {
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

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      isFavourite: json['isFavourite'] as bool,
      firstName: json['firstName'] as String,
      familyName: json['familyName'] as String,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'firstName': instance.firstName,
      'familyName': instance.familyName,
      'detail': instance.detail,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      isFavourite: json['isFavourite'] as bool,
      name: json['name'] as String,
      detail: json['detail'] as String?,
      parent: json['parent'] == null
          ? null
          : Place.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'name': instance.name,
      'detail': instance.detail,
      'parent': instance.parent,
    };

Thing _$ThingFromJson(Map<String, dynamic> json) => Thing(
      isFavourite: json['isFavourite'] as bool,
      name: json['name'] as String,
      owner: json['owner'] == null
          ? null
          : Person.fromJson(json['owner'] as Map<String, dynamic>),
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$ThingToJson(Thing instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'name': instance.name,
      'owner': instance.owner,
      'detail': instance.detail,
    };

Faction _$FactionFromJson(Map<String, dynamic> json) => Faction(
      isFavourite: json['isFavourite'] as bool,
      name: json['name'] as String,
      occupation: json['occupation'] as String?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$FactionToJson(Faction instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'name': instance.name,
      'occupation': instance.occupation,
      'detail': instance.detail,
    };

Clue _$ClueFromJson(Map<String, dynamic> json) => Clue(
      isFavourite: json['isFavourite'] as bool,
      description: json['description'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ClueToJson(Clue instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'description': instance.description,
      'notes': instance.notes,
    };

Creature _$CreatureFromJson(Map<String, dynamic> json) => Creature(
      isFavourite: json['isFavourite'] as bool,
      title: json['title'] as String,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$CreatureToJson(Creature instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'title': instance.title,
      'detail': instance.detail,
    };

DungeonRoom _$DungeonRoomFromJson(Map<String, dynamic> json) => DungeonRoom(
      name: json['name'] as String,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$DungeonRoomToJson(DungeonRoom instance) =>
    <String, dynamic>{
      'name': instance.name,
      'detail': instance.detail,
    };

Dungeon _$DungeonFromJson(Map<String, dynamic> json) => Dungeon(
      isFavourite: json['isFavourite'] as bool,
      title: json['title'] as String,
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => DungeonRoom.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DungeonToJson(Dungeon instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'title': instance.title,
      'rooms': instance.rooms?.map((e) => e.toJson()).toList(),
    };

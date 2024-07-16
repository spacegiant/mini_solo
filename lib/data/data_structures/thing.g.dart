// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thing _$ThingFromJson(Map<String, dynamic> json) => Thing(
      isFavourite: json['isFavourite'] as bool?,
      name: json['name'] as String,
      owner: json['owner'] == null
          ? null
          : Person.fromJson(json['owner'] as Map<String, dynamic>),
      detail: json['detail'] as String?,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$ThingToJson(Thing instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'detail': instance.detail,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

const _$JournalEntryTypesEnumMap = {
  JournalEntryTypes.action: 'action',
  JournalEntryTypes.chaosFactor: 'chaosFactor',
  JournalEntryTypes.fateCheck: 'fateCheck',
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
  JournalEntryTypes.outcome: 'outcome',
  JournalEntryTypes.roll: 'roll',
  JournalEntryTypes.scratchPage: 'scratchPage',
  JournalEntryTypes.randomTable: 'randomTable',
  JournalEntryTypes.rollTableResults: 'rollTableResults',
  JournalEntryTypes.tracker: 'tracker',
  JournalEntryTypes.kard: 'kard',
  JournalEntryTypes.actionList: 'actionList',
  JournalEntryTypes.resultEntry: 'resultEntry',
};

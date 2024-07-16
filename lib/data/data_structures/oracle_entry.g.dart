// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oracle_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OracleEntry _$OracleEntryFromJson(Map<String, dynamic> json) => OracleEntry(
      isFavourite: json['isFavourite'] as bool?,
      lines: JournalEntry.fromJson(json['lines'] as Map<String, dynamic>),
      label: json['label'] as String,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$OracleEntryToJson(OracleEntry instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'lines': instance.lines,
      'label': instance.label,
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

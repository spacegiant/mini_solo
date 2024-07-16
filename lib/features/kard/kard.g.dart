// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kard _$KardFromJson(Map<String, dynamic> json) => Kard(
      title: json['title'] as String,
      lines:
          (json['lines'] as List<dynamic>?)?.map((e) => e as String).toList(),
      layoutType: $enumDecode(_$KardLayoutTypesEnumMap, json['layoutType']),
      firstLineHeadings: json['firstLineHeadings'] as bool? ?? true,
      showHeading: json['showHeading'] as bool? ?? true,
    )
      ..isFavourite = json['isFavourite'] as bool?
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$KardToJson(Kard instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'lines': instance.lines,
      'layoutType': _$KardLayoutTypesEnumMap[instance.layoutType]!,
      'firstLineHeadings': instance.firstLineHeadings,
      'showHeading': instance.showHeading,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

const _$KardLayoutTypesEnumMap = {
  KardLayoutTypes.vertical: 'vertical',
  KardLayoutTypes.horizontal: 'horizontal',
  KardLayoutTypes.statBlockList: 'statBlockList',
  KardLayoutTypes.tabular: 'tabular',
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

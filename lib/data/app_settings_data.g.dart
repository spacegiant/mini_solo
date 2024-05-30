// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingsData _$AppSettingsDataFromJson(Map<String, dynamic> json) =>
    AppSettingsData(
      currentCampaign: json['currentCampaign'] as String,
      randomTables: (json['randomTables'] as List<dynamic>)
          .map((e) => RandomTableEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppSettingsDataToJson(AppSettingsData instance) =>
    <String, dynamic>{
      'currentCampaign': instance.currentCampaign,
      'randomTables': instance.randomTables.map((e) => e.toJson()).toList(),
    };

RandomTableEntry _$RandomTableEntryFromJson(Map<String, dynamic> json) =>
    RandomTableEntry(
      isFavourite: json['isFavourite'] as bool?,
      title: json['title'] as String,
      rows: (json['rows'] as List<dynamic>)
          .map((e) => RandomTableRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$RandomTableEntryToJson(RandomTableEntry instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'rows': instance.rows.map((e) => e.toJson()).toList(),
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
  JournalEntryTypes.transition: 'transition',
  JournalEntryTypes.scratchPage: 'scratchPage',
  JournalEntryTypes.randomTable: 'randomTable',
  JournalEntryTypes.rollTableResult: 'rollTableResult',
};

RandomTableRow _$RandomTableRowFromJson(Map<String, dynamic> json) =>
    RandomTableRow(
      label: json['title'] as String,
      chance: (json['chance'] as num?)?.toInt(),
      otherRandomTable: json['otherRandomTable'] as String?,
    );

Map<String, dynamic> _$RandomTableRowToJson(RandomTableRow instance) =>
    <String, dynamic>{
      'title': instance.label,
      'chance': instance.chance,
      'otherRandomTable': instance.otherRandomTable,
    };

RollTableResult _$RollTableResultFromJson(Map<String, dynamic> json) =>
    RollTableResult(
      weight: (json['weight'] as num).toInt(),
      isFavourite: json['isFavourite'] as bool?,
      title: json['title'] as String,
      randomRoll: (json['randomRoll'] as num).toInt(),
      resultString: json['resultString'] as String,
      totalEntries: (json['totalEntries'] as num).toInt(),
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$RollTableResultToJson(RollTableResult instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'randomRoll': instance.randomRoll,
      'resultString': instance.resultString,
      'totalEntries': instance.totalEntries,
      'weight': instance.weight,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

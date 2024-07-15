// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingsData _$AppSettingsDataFromJson(Map<String, dynamic> json) =>
    AppSettingsData(
      currentCampaign: json['currentCampaign'] as String,
      randomTables: (json['randomTables'] as List<dynamic>)
          .map((e) => RandomTable.fromJson(e as Map<String, dynamic>))
          .toList(),
      expandedList: (json['expandedList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      actionLists: (json['actionLists'] as List<dynamic>)
          .map((e) => ActionListEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppSettingsDataToJson(AppSettingsData instance) =>
    <String, dynamic>{
      'currentCampaign': instance.currentCampaign,
      'randomTables': instance.randomTables.map((e) => e.toJson()).toList(),
      'expandedList': instance.expandedList,
      'actionLists': instance.actionLists.map((e) => e.toJson()).toList(),
    };

RandomTable _$RandomTableFromJson(Map<String, dynamic> json) => RandomTable(
      isFavourite: json['isFavourite'] as bool?,
      title: json['title'] as String,
      rows: (json['rows'] as List<dynamic>)
          .map((e) => RandomTableRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      isHidden: json['isHidden'] as bool? ?? false,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$RandomTableToJson(RandomTable instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'rows': instance.rows.map((e) => e.toJson()).toList(),
      'isHidden': instance.isHidden,
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

RandomTableRow _$RandomTableRowFromJson(Map<String, dynamic> json) =>
    RandomTableRow(
      label: json['label'] as String,
      weight: (json['weight'] as num?)?.toInt(),
      otherRandomTable: json['otherRandomTable'] as String?,
    );

Map<String, dynamic> _$RandomTableRowToJson(RandomTableRow instance) =>
    <String, dynamic>{
      'label': instance.label,
      'weight': instance.weight,
      'otherRandomTable': instance.otherRandomTable,
    };

RollTableResults _$RollTableResultsFromJson(Map<String, dynamic> json) =>
    RollTableResults(
      title: json['title'] as String,
      results: (json['results'] as List<dynamic>)
          .map((e) => RollTableResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..isFavourite = json['isFavourite'] as bool?
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$RollTableResultsToJson(RollTableResults instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

RollTableResult _$RollTableResultFromJson(Map<String, dynamic> json) =>
    RollTableResult(
      weight: (json['weight'] as num?)?.toInt(),
      title: json['title'] as String,
      randomRoll: (json['randomRoll'] as num?)?.toInt(),
      resultString: json['resultString'] as String,
      totalEntries: (json['totalEntries'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RollTableResultToJson(RollTableResult instance) =>
    <String, dynamic>{
      'title': instance.title,
      'randomRoll': instance.randomRoll,
      'resultString': instance.resultString,
      'totalEntries': instance.totalEntries,
      'weight': instance.weight,
    };

ActionListEntry _$ActionListEntryFromJson(Map<String, dynamic> json) =>
    ActionListEntry(
      title: json['title'] as String,
      list: (json['list'] as List<dynamic>)
          .map((e) => ActionRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      isActive: json['isActive'] as bool,
      isHidden: json['isHidden'] as bool,
    )
      ..isFavourite = json['isFavourite'] as bool?
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$ActionListEntryToJson(ActionListEntry instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'isActive': instance.isActive,
      'isHidden': instance.isHidden,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

ActionRow _$ActionRowFromJson(Map<String, dynamic> json) => ActionRow(
      type: $enumDecode(_$ActionEditorTypeEnumMap, json['type']),
      string: json['string'] as String,
    );

Map<String, dynamic> _$ActionRowToJson(ActionRow instance) => <String, dynamic>{
      'type': _$ActionEditorTypeEnumMap[instance.type]!,
      'string': instance.string,
    };

const _$ActionEditorTypeEnumMap = {
  ActionEditorType.label: 'label',
  ActionEditorType.randomTable: 'randomTable',
  ActionEditorType.actionList: 'actionList',
};

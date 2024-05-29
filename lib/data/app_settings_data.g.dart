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
      lines: (json['lines'] as List<dynamic>).map((e) => e as String).toList(),
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$RandomTableEntryToJson(RandomTableEntry instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'lines': instance.lines,
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
};

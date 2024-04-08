// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_entry_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericEntryItem _$GenericEntryItemFromJson(Map<String, dynamic> json) =>
    GenericEntryItem(
      isFavourite: json['isFavourite'] as bool?,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
      title: json['title'] as String,
      label: json['label'] as String?,
      detail: json['detail'] as String?,
    )..id = json['id'] as String;

Map<String, dynamic> _$GenericEntryItemToJson(GenericEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
      'label': instance.label,
      'title': instance.title,
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
  JournalEntryTypes.transition: 'transition',
  JournalEntryTypes.chaosFactor: 'chaosFactor',
  JournalEntryTypes.newPerson: 'newPerson',
  JournalEntryTypes.newPlace: 'newPlace',
  JournalEntryTypes.newThing: 'newThing',
  JournalEntryTypes.newFaction: 'newFaction',
  JournalEntryTypes.dialogue: 'dialogue',
};

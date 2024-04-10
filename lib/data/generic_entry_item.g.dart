// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_entry_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericEntryItem _$GenericEntryItemFromJson(Map<String, dynamic> json) =>
    GenericEntryItem(
      isFavourite: json['isFavourite'] as bool?,
      title: json['title'] as String,
      label: json['label'] as String?,
      detail: json['detail'] as String?,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$GenericEntryItemToJson(GenericEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'label': instance.label,
      'title': instance.title,
      'detail': instance.detail,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

const _$JournalEntryTypesEnumMap = {
  JournalEntryTypes.action: 'action',
  JournalEntryTypes.chaosFactor: 'chaosFactor',
  JournalEntryTypes.dialogue: 'dialogue',
  JournalEntryTypes.fateCheck: 'fateCheck',
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
};

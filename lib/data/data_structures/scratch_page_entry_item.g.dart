// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scratch_page_entry_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScratchPageEntryItem _$ScratchPageEntryItemFromJson(
        Map<String, dynamic> json) =>
    ScratchPageEntryItem(
      isFavourite: json['isFavourite'] as bool?,
      title: json['title'] as String,
      text: json['text'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$ScratchPageEntryItemToJson(
        ScratchPageEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'dateCreated': instance.dateCreated.toIso8601String(),
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kard _$KardFromJson(Map<String, dynamic> json) => Kard(
      title: json['title'] as String,
      lines:
          (json['lines'] as List<dynamic>?)?.map((e) => e as String).toList(),
      labelLayout:
          $enumDecodeNullable(_$LabelLayoutEnumMap, json['labelLayout']),
      controlType: $enumDecode(_$ControlTypeEnumEnumMap, json['controlType']),
    )
      ..isFavourite = json['isFavourite'] as bool?
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$KardToJson(Kard instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'lines': instance.lines,
      'labelLayout': _$LabelLayoutEnumMap[instance.labelLayout],
      'controlType': _$ControlTypeEnumEnumMap[instance.controlType]!,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

const _$LabelLayoutEnumMap = {
  LabelLayout.vertical: 'vertical',
  LabelLayout.horizontal: 'horizontal',
};

const _$ControlTypeEnumEnumMap = {
  ControlTypeEnum.button: 'button',
  ControlTypeEnum.dice: 'dice',
  ControlTypeEnum.diceGroup: 'diceGroup',
  ControlTypeEnum.mythicChart: 'mythicChart',
  ControlTypeEnum.newScene: 'newScene',
  ControlTypeEnum.mythicExpectedScene: 'mythicExpectedScene',
  ControlTypeEnum.mythicAction: 'mythicAction',
  ControlTypeEnum.mythicDescription: 'mythicDescription',
  ControlTypeEnum.mythicEventFocus: 'mythicEventFocus',
  ControlTypeEnum.mythicPlotTwist: 'mythicPlotTwist',
  ControlTypeEnum.randomTable: 'randomTable',
  ControlTypeEnum.clock4: 'clock4',
  ControlTypeEnum.clock6: 'clock6',
  ControlTypeEnum.clock8: 'clock8',
  ControlTypeEnum.bar: 'bar',
  ControlTypeEnum.ironsworn1Troublesome: 'ironsworn1Troublesome',
  ControlTypeEnum.ironsworn2Dangerous: 'ironsworn2Dangerous',
  ControlTypeEnum.ironsworn3Formidable: 'ironsworn3Formidable',
  ControlTypeEnum.ironsworn4Extreme: 'ironsworn4Extreme',
  ControlTypeEnum.ironsworn5Epic: 'ironsworn5Epic',
  ControlTypeEnum.pips: 'pips',
  ControlTypeEnum.value: 'value',
  ControlTypeEnum.counter: 'counter',
  ControlTypeEnum.fate_aspect: 'fate_aspect',
  ControlTypeEnum.newTracker: 'newTracker',
  ControlTypeEnum.newRandomTable: 'newRandomTable',
  ControlTypeEnum.newGroup: 'newGroup',
  ControlTypeEnum.statBlock: 'statBlock',
  ControlTypeEnum.kard: 'kard',
  ControlTypeEnum.newCard: 'newCard',
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
};

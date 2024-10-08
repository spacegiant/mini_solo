// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackerEntry _$TrackerEntryFromJson(Map<String, dynamic> json) => TrackerEntry(
      label: json['label'] as String,
      currentValue: (json['currentValue'] as num).toInt(),
      minValue: (json['minValue'] as num?)?.toInt(),
      maxValue: (json['maxValue'] as num?)?.toInt(),
      controlType: $enumDecode(_$ControlTypeEnumEnumMap, json['controlType']),
    )
      ..isFavourite = json['isFavourite'] as bool?
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$TrackerEntryToJson(TrackerEntry instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'label': instance.label,
      'currentValue': instance.currentValue,
      'minValue': instance.minValue,
      'maxValue': instance.maxValue,
      'controlType': _$ControlTypeEnumEnumMap[instance.controlType]!,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
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
  ControlTypeEnum.counter: 'counter',
  ControlTypeEnum.fate_aspect: 'fate_aspect',
  ControlTypeEnum.newTracker: 'newTracker',
  ControlTypeEnum.newRandomTable: 'newRandomTable',
  ControlTypeEnum.newGroup: 'newGroup',
  ControlTypeEnum.statBlock: 'statBlock',
  ControlTypeEnum.kard: 'kard',
  ControlTypeEnum.newCard: 'newCard',
  ControlTypeEnum.newActionList: 'newActionList',
  ControlTypeEnum.actionList: 'actionList',
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

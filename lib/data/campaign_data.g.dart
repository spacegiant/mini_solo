// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnObject _$ReturnObjectFromJson(Map<String, dynamic> json) => ReturnObject(
      type: json['type'] as String,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      result: json['result'] as String,
    );

Map<String, dynamic> _$ReturnObjectToJson(ReturnObject instance) =>
    <String, dynamic>{
      'type': instance.type,
      'line1': instance.line1,
      'line2': instance.line2,
      'result': instance.result,
    };

SettingsData _$SettingsDataFromJson(Map<String, dynamic> json) => SettingsData(
      general:
          GeneralSettingsData.fromJson(json['general'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsDataToJson(SettingsData instance) =>
    <String, dynamic>{
      'general': instance.general.toJson(),
    };

GeneralSettingsData _$GeneralSettingsDataFromJson(Map<String, dynamic> json) =>
    GeneralSettingsData(
      showFutureSettings: json['showFutureSettings'] as bool,
      useJournal: json['useJournal'] as bool,
      useRegularDice: json['useRegularDice'] as bool,
      useZocchiDice: json['useZocchiDice'] as bool,
      useFateDice: json['useFateDice'] as bool,
      useCoriolisDice: json['useCoriolisDice'] as bool,
      useD6Oracle: json['useD6Oracle'] as bool,
      wrapControls: json['wrapControls'] as bool,
    );

Map<String, dynamic> _$GeneralSettingsDataToJson(
        GeneralSettingsData instance) =>
    <String, dynamic>{
      'showFutureSettings': instance.showFutureSettings,
      'useJournal': instance.useJournal,
      'useZocchiDice': instance.useZocchiDice,
      'useRegularDice': instance.useRegularDice,
      'useFateDice': instance.useFateDice,
      'useCoriolisDice': instance.useCoriolisDice,
      'useD6Oracle': instance.useD6Oracle,
      'wrapControls': instance.wrapControls,
    };

CampaignData _$CampaignDataFromJson(Map<String, dynamic> json) => CampaignData(
      settings: SettingsData.fromJson(json['settings'] as Map<String, dynamic>),
      name: json['name'] as String,
      currentScratchEntryId: json['currentScratchEntryId'] as String,
      filename: json['filename'] as String,
      mythic: (json['mythic'] as List<dynamic>)
          .map((e) => MythicEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      mythicData:
          MythicData.fromJson(json['mythicData'] as Map<String, dynamic>),
      oracle: (json['oracle'] as List<dynamic>)
          .map((e) => OracleEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      journal: (json['journal'] as List<dynamic>)
          .map((e) => JournalEntryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: (json['notes'] as List<dynamic>)
          .map((e) => NoteEntryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      people: (json['people'] as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      places: (json['places'] as List<dynamic>)
          .map((e) => Place.fromJson(e as Map<String, dynamic>))
          .toList(),
      things: (json['things'] as List<dynamic>)
          .map((e) => Thing.fromJson(e as Map<String, dynamic>))
          .toList(),
      factions: (json['factions'] as List<dynamic>)
          .map((e) => Faction.fromJson(e as Map<String, dynamic>))
          .toList(),
      clues: (json['clues'] as List<dynamic>)
          .map((e) => Clue.fromJson(e as Map<String, dynamic>))
          .toList(),
      creatures: (json['creatures'] as List<dynamic>)
          .map((e) => Creature.fromJson(e as Map<String, dynamic>))
          .toList(),
      rolls: (json['rolls'] as List<dynamic>)
          .map((e) => RollEntryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      scratchPad: (json['scratchPad'] as List<dynamic>)
          .map((e) => ScratchPageEntryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      rollTableResult: (json['rollTableResult'] as List<dynamic>)
          .map((e) => RollTableResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CampaignDataToJson(CampaignData instance) =>
    <String, dynamic>{
      'settings': instance.settings.toJson(),
      'name': instance.name,
      'currentScratchEntryId': instance.currentScratchEntryId,
      'filename': instance.filename,
      'mythicData': instance.mythicData.toJson(),
      'mythic': instance.mythic.map((e) => e.toJson()).toList(),
      'journal': instance.journal.map((e) => e.toJson()).toList(),
      'notes': instance.notes.map((e) => e.toJson()).toList(),
      'oracle': instance.oracle.map((e) => e.toJson()).toList(),
      'people': instance.people.map((e) => e.toJson()).toList(),
      'places': instance.places.map((e) => e.toJson()).toList(),
      'things': instance.things.map((e) => e.toJson()).toList(),
      'factions': instance.factions.map((e) => e.toJson()).toList(),
      'clues': instance.clues.map((e) => e.toJson()).toList(),
      'creatures': instance.creatures.map((e) => e.toJson()).toList(),
      'rolls': instance.rolls.map((e) => e.toJson()).toList(),
      'scratchPad': instance.scratchPad.map((e) => e.toJson()).toList(),
      'rollTableResult':
          instance.rollTableResult.map((e) => e.toJson()).toList(),
    };

MythicData _$MythicDataFromJson(Map<String, dynamic> json) => MythicData(
      chaosFactor: (json['chaosFactor'] as num).toInt(),
    );

Map<String, dynamic> _$MythicDataToJson(MythicData instance) =>
    <String, dynamic>{
      'chaosFactor': instance.chaosFactor,
    };

JournalEntryItem _$JournalEntryItemFromJson(Map<String, dynamic> json) =>
    JournalEntryItem(
      isFavourite: json['isFavourite'] as bool,
      type: $enumDecode(_$JournalEntryTypesEnumMap, json['type']),
      id: json['id'] as String,
    );

Map<String, dynamic> _$JournalEntryItemToJson(JournalEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
      'id': instance.id,
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

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      isFavourite: json['isFavourite'] as bool?,
      firstName: json['firstName'] as String,
      familyName: json['familyName'] as String,
      detail: json['detail'] as String?,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'firstName': instance.firstName,
      'familyName': instance.familyName,
      'detail': instance.detail,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

Place _$PlaceFromJson(Map<String, dynamic> json) => Place(
      isFavourite: json['isFavourite'] as bool?,
      name: json['name'] as String,
      detail: json['detail'] as String?,
      parent: json['parent'] == null
          ? null
          : Place.fromJson(json['parent'] as Map<String, dynamic>),
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'name': instance.name,
      'detail': instance.detail,
      'parent': instance.parent,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

Thing _$ThingFromJson(Map<String, dynamic> json) => Thing(
      isFavourite: json['isFavourite'] as bool?,
      name: json['name'] as String,
      owner: json['owner'] == null
          ? null
          : Person.fromJson(json['owner'] as Map<String, dynamic>),
      detail: json['detail'] as String?,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$ThingToJson(Thing instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'detail': instance.detail,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

Faction _$FactionFromJson(Map<String, dynamic> json) => Faction(
      isFavourite: json['isFavourite'] as bool?,
      name: json['name'] as String,
      occupation: json['occupation'] as String?,
      detail: json['detail'] as String?,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$FactionToJson(Faction instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'name': instance.name,
      'occupation': instance.occupation,
      'detail': instance.detail,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

Clue _$ClueFromJson(Map<String, dynamic> json) => Clue(
      isFavourite: json['isFavourite'] as bool?,
      description: json['description'] as String,
      notes: json['notes'] as String?,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$ClueToJson(Clue instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'description': instance.description,
      'notes': instance.notes,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

Creature _$CreatureFromJson(Map<String, dynamic> json) => Creature(
      isFavourite: json['isFavourite'] as bool?,
      title: json['title'] as String,
      detail: json['detail'] as String?,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$CreatureToJson(Creature instance) => <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'title': instance.title,
      'detail': instance.detail,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

BothResults _$BothResultsFromJson(Map<String, dynamic> json) => BothResults(
      rolledValue: (json['rolledValue'] as num).toInt(),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$BothResultsToJson(BothResults instance) =>
    <String, dynamic>{
      'rolledValue': instance.rolledValue,
      'label': instance.label,
    };

DiceRoll _$DiceRollFromJson(Map<String, dynamic> json) => DiceRoll(
      result: BothResults.fromJson(json['result'] as Map<String, dynamic>),
      diceType: json['diceType'] as String,
      icon: $enumDecode(_$ImagesEnumMap, json['icon']),
    );

Map<String, dynamic> _$DiceRollToJson(DiceRoll instance) => <String, dynamic>{
      'result': instance.result,
      'diceType': instance.diceType,
      'icon': _$ImagesEnumMap[instance.icon]!,
    };

const _$ImagesEnumMap = {
  Images.placeholder: 'placeholder',
  Images.d6Oracle: 'd6Oracle',
  Images.d6OracleYesAnd: 'd6OracleYesAnd',
  Images.d6OracleYes: 'd6OracleYes',
  Images.d6OracleYesBut: 'd6OracleYesBut',
  Images.d6OracleNoBut: 'd6OracleNoBut',
  Images.d6OracleNo: 'd6OracleNo',
  Images.d6OracleNoAnd: 'd6OracleNoAnd',
  Images.coriolis1: 'coriolis1',
  Images.coriolis2: 'coriolis2',
  Images.coriolis3: 'coriolis3',
  Images.coriolis4: 'coriolis4',
  Images.coriolis5: 'coriolis5',
  Images.coriolis6: 'coriolis6',
  Images.d2_1: 'd2_1',
  Images.d2_2: 'd2_2',
  Images.d3_1: 'd3_1',
  Images.d3_2: 'd3_2',
  Images.d3_3: 'd3_3',
  Images.d4_1: 'd4_1',
  Images.d4_2: 'd4_2',
  Images.d4_3: 'd4_3',
  Images.d4_4: 'd4_4',
  Images.d5_1: 'd5_1',
  Images.d5_2: 'd5_2',
  Images.d5_3: 'd5_3',
  Images.d5_4: 'd5_4',
  Images.d5_5: 'd5_5',
  Images.d6_1: 'd6_1',
  Images.d6_2: 'd6_2',
  Images.d6_3: 'd6_3',
  Images.d6_4: 'd6_4',
  Images.d6_5: 'd6_5',
  Images.d6_6: 'd6_6',
  Images.d7_1: 'd7_1',
  Images.d7_2: 'd7_2',
  Images.d7_3: 'd7_3',
  Images.d7_4: 'd7_4',
  Images.d7_5: 'd7_5',
  Images.d7_6: 'd7_6',
  Images.d7_7: 'd7_7',
  Images.d8_1: 'd8_1',
  Images.d8_2: 'd8_2',
  Images.d8_3: 'd8_3',
  Images.d8_4: 'd8_4',
  Images.d8_5: 'd8_5',
  Images.d8_6: 'd8_6',
  Images.d8_7: 'd8_7',
  Images.d8_8: 'd8_8',
  Images.d10_1: 'd10_1',
  Images.d10_2: 'd10_2',
  Images.d10_3: 'd10_3',
  Images.d10_4: 'd10_4',
  Images.d10_5: 'd10_5',
  Images.d10_6: 'd10_6',
  Images.d10_7: 'd10_7',
  Images.d10_8: 'd10_8',
  Images.d10_9: 'd10_9',
  Images.d10_10: 'd10_10',
  Images.d100_1: 'd100_1',
  Images.d100_2: 'd100_2',
  Images.d100_3: 'd100_3',
  Images.d100_4: 'd100_4',
  Images.d100_5: 'd100_5',
  Images.d100_6: 'd100_6',
  Images.d100_7: 'd100_7',
  Images.d100_8: 'd100_8',
  Images.d100_9: 'd100_9',
  Images.d100_10: 'd100_10',
  Images.d12_1: 'd12_1',
  Images.d12_2: 'd12_2',
  Images.d12_3: 'd12_3',
  Images.d12_4: 'd12_4',
  Images.d12_5: 'd12_5',
  Images.d12_6: 'd12_6',
  Images.d12_7: 'd12_7',
  Images.d12_8: 'd12_8',
  Images.d12_9: 'd12_9',
  Images.d12_10: 'd12_10',
  Images.d12_11: 'd12_11',
  Images.d12_12: 'd12_12',
  Images.d14_1: 'd14_1',
  Images.d14_2: 'd14_2',
  Images.d14_3: 'd14_3',
  Images.d14_4: 'd14_4',
  Images.d14_5: 'd14_5',
  Images.d14_6: 'd14_6',
  Images.d14_7: 'd14_7',
  Images.d14_8: 'd14_8',
  Images.d14_9: 'd14_9',
  Images.d14_10: 'd14_10',
  Images.d14_11: 'd14_11',
  Images.d14_12: 'd14_12',
  Images.d14_13: 'd14_13',
  Images.d14_14: 'd14_14',
  Images.d16_1: 'd16_1',
  Images.d16_2: 'd16_2',
  Images.d16_3: 'd16_3',
  Images.d16_4: 'd16_4',
  Images.d16_5: 'd16_5',
  Images.d16_6: 'd16_6',
  Images.d16_7: 'd16_7',
  Images.d16_8: 'd16_8',
  Images.d16_9: 'd16_9',
  Images.d16_10: 'd16_10',
  Images.d16_11: 'd16_11',
  Images.d16_12: 'd16_12',
  Images.d16_13: 'd16_13',
  Images.d16_14: 'd16_14',
  Images.d16_15: 'd16_15',
  Images.d16_16: 'd16_16',
  Images.d20_1: 'd20_1',
  Images.d20_2: 'd20_2',
  Images.d20_3: 'd20_3',
  Images.d20_4: 'd20_4',
  Images.d20_5: 'd20_5',
  Images.d20_6: 'd20_6',
  Images.d20_7: 'd20_7',
  Images.d20_8: 'd20_8',
  Images.d20_9: 'd20_9',
  Images.d20_10: 'd20_10',
  Images.d20_11: 'd20_11',
  Images.d20_12: 'd20_12',
  Images.d20_13: 'd20_13',
  Images.d20_14: 'd20_14',
  Images.d20_15: 'd20_15',
  Images.d20_16: 'd20_16',
  Images.d20_17: 'd20_17',
  Images.d20_18: 'd20_18',
  Images.d20_19: 'd20_19',
  Images.d20_20: 'd20_20',
  Images.d24_1: 'd24_1',
  Images.d24_2: 'd24_2',
  Images.d24_3: 'd24_3',
  Images.d24_4: 'd24_4',
  Images.d24_5: 'd24_5',
  Images.d24_6: 'd24_6',
  Images.d24_7: 'd24_7',
  Images.d24_8: 'd24_8',
  Images.d24_9: 'd24_9',
  Images.d24_10: 'd24_10',
  Images.d24_11: 'd24_11',
  Images.d24_12: 'd24_12',
  Images.d24_13: 'd24_13',
  Images.d24_14: 'd24_14',
  Images.d24_15: 'd24_15',
  Images.d24_16: 'd24_16',
  Images.d24_17: 'd24_17',
  Images.d24_18: 'd24_18',
  Images.d24_19: 'd24_19',
  Images.d24_20: 'd24_20',
  Images.d24_21: 'd24_21',
  Images.d24_22: 'd24_22',
  Images.d24_23: 'd24_23',
  Images.d24_24: 'd24_24',
  Images.d30_1: 'd30_1',
  Images.d30_2: 'd30_2',
  Images.d30_3: 'd30_3',
  Images.d30_4: 'd30_4',
  Images.d30_5: 'd30_5',
  Images.d30_6: 'd30_6',
  Images.d30_7: 'd30_7',
  Images.d30_8: 'd30_8',
  Images.d30_9: 'd30_9',
  Images.d30_10: 'd30_10',
  Images.d30_11: 'd30_11',
  Images.d30_12: 'd30_12',
  Images.d30_13: 'd30_13',
  Images.d30_14: 'd30_14',
  Images.d30_15: 'd30_15',
  Images.d30_16: 'd30_16',
  Images.d30_17: 'd30_17',
  Images.d30_18: 'd30_18',
  Images.d30_19: 'd30_19',
  Images.d30_20: 'd30_20',
  Images.d30_21: 'd30_21',
  Images.d30_22: 'd30_22',
  Images.d30_23: 'd30_23',
  Images.d30_24: 'd30_24',
  Images.d30_25: 'd30_25',
  Images.d30_26: 'd30_26',
  Images.d30_27: 'd30_27',
  Images.d30_28: 'd30_28',
  Images.d30_29: 'd30_29',
  Images.d30_30: 'd30_30',
  Images.fateDice: 'fateDice',
  Images.fatePlus: 'fatePlus',
  Images.fateBlank: 'fateBlank',
  Images.fateMinus: 'fateMinus',
};

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

RollEntryItem _$RollEntryItemFromJson(Map<String, dynamic> json) =>
    RollEntryItem(
      isFavourite: json['isFavourite'] as bool?,
      result: (json['result'] as List<dynamic>)
          .map((e) => DiceRoll.fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['label'] as String? ?? 'Dice Roll',
      icon: $enumDecodeNullable(_$ImagesEnumMap, json['icon']),
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$RollEntryItemToJson(RollEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'result': instance.result,
      'label': instance.label,
      'icon': _$ImagesEnumMap[instance.icon],
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

OracleEntry _$OracleEntryFromJson(Map<String, dynamic> json) => OracleEntry(
      isFavourite: json['isFavourite'] as bool?,
      lines: ReturnObject.fromJson(json['lines'] as Map<String, dynamic>),
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

MythicEntry _$MythicEntryFromJson(Map<String, dynamic> json) => MythicEntry(
      isFavourite: json['isFavourite'] as bool?,
      lines: ReturnObject.fromJson(json['lines'] as Map<String, dynamic>),
      label: json['label'] as String,
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$MythicEntryToJson(MythicEntry instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'lines': instance.lines,
      'label': instance.label,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

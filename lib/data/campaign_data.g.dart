// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalReturnObject _$JournalReturnObjectFromJson(Map<String, dynamic> json) =>
    JournalReturnObject(
      type: json['type'] as String,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      result: json['result'] as String,
    );

Map<String, dynamic> _$JournalReturnObjectToJson(
        JournalReturnObject instance) =>
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
      showMechanics: json['showMechanics'] as bool,
      useJournal: json['useJournal'] as bool,
      useRegularDice: json['useRegularDice'] as bool,
      useZocchiDice: json['useZocchiDice'] as bool,
      useFateDice: json['useFateDice'] as bool,
      useCoriolisDice: json['useCoriolisDice'] as bool,
      useD6Oracle: json['useD6Oracle'] as bool,
      wrapControls: json['wrapControls'] as bool,
      hiddenEntryTypes: (json['hiddenEntryTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$JournalEntryTypesEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$GeneralSettingsDataToJson(
        GeneralSettingsData instance) =>
    <String, dynamic>{
      'showFutureSettings': instance.showFutureSettings,
      'showMechanics': instance.showMechanics,
      'useJournal': instance.useJournal,
      'useZocchiDice': instance.useZocchiDice,
      'useRegularDice': instance.useRegularDice,
      'useFateDice': instance.useFateDice,
      'useCoriolisDice': instance.useCoriolisDice,
      'useD6Oracle': instance.useD6Oracle,
      'wrapControls': instance.wrapControls,
      'hiddenEntryTypes': instance.hiddenEntryTypes
          .map((e) => _$JournalEntryTypesEnumMap[e]!)
          .toList(),
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
  JournalEntryTypes.rollTableResult: 'rollTableResult',
  JournalEntryTypes.tracker: 'tracker',
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
      tracker: (json['tracker'] as List<dynamic>)
          .map((e) => TrackerEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      newScene: (json['newScene'] as List<dynamic>)
          .map((e) => NewSceneEntry.fromJson(e as Map<String, dynamic>))
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
      'tracker': instance.tracker.map((e) => e.toJson()).toList(),
      'newScene': instance.newScene.map((e) => e.toJson()).toList(),
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
      icon: $enumDecode(_$SVGIconEnumMap, json['icon']),
    );

Map<String, dynamic> _$DiceRollToJson(DiceRoll instance) => <String, dynamic>{
      'result': instance.result,
      'diceType': instance.diceType,
      'icon': _$SVGIconEnumMap[instance.icon]!,
    };

const _$SVGIconEnumMap = {
  SVGIcon.placeholder: 'placeholder',
  SVGIcon.d6Oracle: 'd6Oracle',
  SVGIcon.d6OracleYesAnd: 'd6OracleYesAnd',
  SVGIcon.d6OracleYes: 'd6OracleYes',
  SVGIcon.d6OracleYesBut: 'd6OracleYesBut',
  SVGIcon.d6OracleNoBut: 'd6OracleNoBut',
  SVGIcon.d6OracleNo: 'd6OracleNo',
  SVGIcon.d6OracleNoAnd: 'd6OracleNoAnd',
  SVGIcon.coriolis1: 'coriolis1',
  SVGIcon.coriolis2: 'coriolis2',
  SVGIcon.coriolis3: 'coriolis3',
  SVGIcon.coriolis4: 'coriolis4',
  SVGIcon.coriolis5: 'coriolis5',
  SVGIcon.coriolis6: 'coriolis6',
  SVGIcon.d2_1: 'd2_1',
  SVGIcon.d2_2: 'd2_2',
  SVGIcon.d3_1: 'd3_1',
  SVGIcon.d3_2: 'd3_2',
  SVGIcon.d3_3: 'd3_3',
  SVGIcon.d4_1: 'd4_1',
  SVGIcon.d4_2: 'd4_2',
  SVGIcon.d4_3: 'd4_3',
  SVGIcon.d4_4: 'd4_4',
  SVGIcon.d5_1: 'd5_1',
  SVGIcon.d5_2: 'd5_2',
  SVGIcon.d5_3: 'd5_3',
  SVGIcon.d5_4: 'd5_4',
  SVGIcon.d5_5: 'd5_5',
  SVGIcon.d6_1: 'd6_1',
  SVGIcon.d6_2: 'd6_2',
  SVGIcon.d6_3: 'd6_3',
  SVGIcon.d6_4: 'd6_4',
  SVGIcon.d6_5: 'd6_5',
  SVGIcon.d6_6: 'd6_6',
  SVGIcon.d7_1: 'd7_1',
  SVGIcon.d7_2: 'd7_2',
  SVGIcon.d7_3: 'd7_3',
  SVGIcon.d7_4: 'd7_4',
  SVGIcon.d7_5: 'd7_5',
  SVGIcon.d7_6: 'd7_6',
  SVGIcon.d7_7: 'd7_7',
  SVGIcon.d8_1: 'd8_1',
  SVGIcon.d8_2: 'd8_2',
  SVGIcon.d8_3: 'd8_3',
  SVGIcon.d8_4: 'd8_4',
  SVGIcon.d8_5: 'd8_5',
  SVGIcon.d8_6: 'd8_6',
  SVGIcon.d8_7: 'd8_7',
  SVGIcon.d8_8: 'd8_8',
  SVGIcon.d10_1: 'd10_1',
  SVGIcon.d10_2: 'd10_2',
  SVGIcon.d10_3: 'd10_3',
  SVGIcon.d10_4: 'd10_4',
  SVGIcon.d10_5: 'd10_5',
  SVGIcon.d10_6: 'd10_6',
  SVGIcon.d10_7: 'd10_7',
  SVGIcon.d10_8: 'd10_8',
  SVGIcon.d10_9: 'd10_9',
  SVGIcon.d10_10: 'd10_10',
  SVGIcon.d10_dice: 'd10_dice',
  SVGIcon.d100_1: 'd100_1',
  SVGIcon.d100_2: 'd100_2',
  SVGIcon.d100_3: 'd100_3',
  SVGIcon.d100_4: 'd100_4',
  SVGIcon.d100_5: 'd100_5',
  SVGIcon.d100_6: 'd100_6',
  SVGIcon.d100_7: 'd100_7',
  SVGIcon.d100_8: 'd100_8',
  SVGIcon.d100_9: 'd100_9',
  SVGIcon.d100_10: 'd100_10',
  SVGIcon.d12_1: 'd12_1',
  SVGIcon.d12_2: 'd12_2',
  SVGIcon.d12_3: 'd12_3',
  SVGIcon.d12_4: 'd12_4',
  SVGIcon.d12_5: 'd12_5',
  SVGIcon.d12_6: 'd12_6',
  SVGIcon.d12_7: 'd12_7',
  SVGIcon.d12_8: 'd12_8',
  SVGIcon.d12_9: 'd12_9',
  SVGIcon.d12_10: 'd12_10',
  SVGIcon.d12_11: 'd12_11',
  SVGIcon.d12_12: 'd12_12',
  SVGIcon.d14_1: 'd14_1',
  SVGIcon.d14_2: 'd14_2',
  SVGIcon.d14_3: 'd14_3',
  SVGIcon.d14_4: 'd14_4',
  SVGIcon.d14_5: 'd14_5',
  SVGIcon.d14_6: 'd14_6',
  SVGIcon.d14_7: 'd14_7',
  SVGIcon.d14_8: 'd14_8',
  SVGIcon.d14_9: 'd14_9',
  SVGIcon.d14_10: 'd14_10',
  SVGIcon.d14_11: 'd14_11',
  SVGIcon.d14_12: 'd14_12',
  SVGIcon.d14_13: 'd14_13',
  SVGIcon.d14_14: 'd14_14',
  SVGIcon.d16_1: 'd16_1',
  SVGIcon.d16_2: 'd16_2',
  SVGIcon.d16_3: 'd16_3',
  SVGIcon.d16_4: 'd16_4',
  SVGIcon.d16_5: 'd16_5',
  SVGIcon.d16_6: 'd16_6',
  SVGIcon.d16_7: 'd16_7',
  SVGIcon.d16_8: 'd16_8',
  SVGIcon.d16_9: 'd16_9',
  SVGIcon.d16_10: 'd16_10',
  SVGIcon.d16_11: 'd16_11',
  SVGIcon.d16_12: 'd16_12',
  SVGIcon.d16_13: 'd16_13',
  SVGIcon.d16_14: 'd16_14',
  SVGIcon.d16_15: 'd16_15',
  SVGIcon.d16_16: 'd16_16',
  SVGIcon.d20_1: 'd20_1',
  SVGIcon.d20_2: 'd20_2',
  SVGIcon.d20_3: 'd20_3',
  SVGIcon.d20_4: 'd20_4',
  SVGIcon.d20_5: 'd20_5',
  SVGIcon.d20_6: 'd20_6',
  SVGIcon.d20_7: 'd20_7',
  SVGIcon.d20_8: 'd20_8',
  SVGIcon.d20_9: 'd20_9',
  SVGIcon.d20_10: 'd20_10',
  SVGIcon.d20_11: 'd20_11',
  SVGIcon.d20_12: 'd20_12',
  SVGIcon.d20_13: 'd20_13',
  SVGIcon.d20_14: 'd20_14',
  SVGIcon.d20_15: 'd20_15',
  SVGIcon.d20_16: 'd20_16',
  SVGIcon.d20_17: 'd20_17',
  SVGIcon.d20_18: 'd20_18',
  SVGIcon.d20_19: 'd20_19',
  SVGIcon.d20_20: 'd20_20',
  SVGIcon.d24_1: 'd24_1',
  SVGIcon.d24_2: 'd24_2',
  SVGIcon.d24_3: 'd24_3',
  SVGIcon.d24_4: 'd24_4',
  SVGIcon.d24_5: 'd24_5',
  SVGIcon.d24_6: 'd24_6',
  SVGIcon.d24_7: 'd24_7',
  SVGIcon.d24_8: 'd24_8',
  SVGIcon.d24_9: 'd24_9',
  SVGIcon.d24_10: 'd24_10',
  SVGIcon.d24_11: 'd24_11',
  SVGIcon.d24_12: 'd24_12',
  SVGIcon.d24_13: 'd24_13',
  SVGIcon.d24_14: 'd24_14',
  SVGIcon.d24_15: 'd24_15',
  SVGIcon.d24_16: 'd24_16',
  SVGIcon.d24_17: 'd24_17',
  SVGIcon.d24_18: 'd24_18',
  SVGIcon.d24_19: 'd24_19',
  SVGIcon.d24_20: 'd24_20',
  SVGIcon.d24_21: 'd24_21',
  SVGIcon.d24_22: 'd24_22',
  SVGIcon.d24_23: 'd24_23',
  SVGIcon.d24_24: 'd24_24',
  SVGIcon.d30_1: 'd30_1',
  SVGIcon.d30_2: 'd30_2',
  SVGIcon.d30_3: 'd30_3',
  SVGIcon.d30_4: 'd30_4',
  SVGIcon.d30_5: 'd30_5',
  SVGIcon.d30_6: 'd30_6',
  SVGIcon.d30_7: 'd30_7',
  SVGIcon.d30_8: 'd30_8',
  SVGIcon.d30_9: 'd30_9',
  SVGIcon.d30_10: 'd30_10',
  SVGIcon.d30_11: 'd30_11',
  SVGIcon.d30_12: 'd30_12',
  SVGIcon.d30_13: 'd30_13',
  SVGIcon.d30_14: 'd30_14',
  SVGIcon.d30_15: 'd30_15',
  SVGIcon.d30_16: 'd30_16',
  SVGIcon.d30_17: 'd30_17',
  SVGIcon.d30_18: 'd30_18',
  SVGIcon.d30_19: 'd30_19',
  SVGIcon.d30_20: 'd30_20',
  SVGIcon.d30_21: 'd30_21',
  SVGIcon.d30_22: 'd30_22',
  SVGIcon.d30_23: 'd30_23',
  SVGIcon.d30_24: 'd30_24',
  SVGIcon.d30_25: 'd30_25',
  SVGIcon.d30_26: 'd30_26',
  SVGIcon.d30_27: 'd30_27',
  SVGIcon.d30_28: 'd30_28',
  SVGIcon.d30_29: 'd30_29',
  SVGIcon.d30_30: 'd30_30',
  SVGIcon.fateDice: 'fateDice',
  SVGIcon.fatePlus: 'fatePlus',
  SVGIcon.fateBlank: 'fateBlank',
  SVGIcon.fateMinus: 'fateMinus',
  SVGIcon.ironsworn_tick_0: 'ironsworn_tick_0',
  SVGIcon.ironsworn_tick_1: 'ironsworn_tick_1',
  SVGIcon.ironsworn_tick_2: 'ironsworn_tick_2',
  SVGIcon.ironsworn_tick_3: 'ironsworn_tick_3',
  SVGIcon.ironsworn_tick_4: 'ironsworn_tick_4',
  SVGIcon.clock4_0: 'clock4_0',
  SVGIcon.clock4_1: 'clock4_1',
  SVGIcon.clock4_2: 'clock4_2',
  SVGIcon.clock4_3: 'clock4_3',
  SVGIcon.clock4_4: 'clock4_4',
  SVGIcon.clock6_0: 'clock6_0',
  SVGIcon.clock6_1: 'clock6_1',
  SVGIcon.clock6_2: 'clock6_2',
  SVGIcon.clock6_3: 'clock6_3',
  SVGIcon.clock6_4: 'clock6_4',
  SVGIcon.clock6_5: 'clock6_5',
  SVGIcon.clock6_6: 'clock6_6',
  SVGIcon.clock8_0: 'clock8_0',
  SVGIcon.clock8_1: 'clock8_1',
  SVGIcon.clock8_2: 'clock8_2',
  SVGIcon.clock8_3: 'clock8_3',
  SVGIcon.clock8_4: 'clock8_4',
  SVGIcon.clock8_5: 'clock8_5',
  SVGIcon.clock8_6: 'clock8_6',
  SVGIcon.clock8_7: 'clock8_7',
  SVGIcon.clock8_8: 'clock8_8',
  SVGIcon.bar_tracker: 'bar_tracker',
  SVGIcon.pip_checked: 'pip_checked',
  SVGIcon.pip_icon: 'pip_icon',
  SVGIcon.pip_unchecked: 'pip_unchecked',
  SVGIcon.value_tracker: 'value_tracker',
  SVGIcon.counter_tracker: 'counter_tracker',
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
      icon: $enumDecodeNullable(_$SVGIconEnumMap, json['icon']),
    )
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$RollEntryItemToJson(RollEntryItem instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'result': instance.result,
      'label': instance.label,
      'icon': _$SVGIconEnumMap[instance.icon],
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

OracleEntry _$OracleEntryFromJson(Map<String, dynamic> json) => OracleEntry(
      isFavourite: json['isFavourite'] as bool?,
      lines:
          JournalReturnObject.fromJson(json['lines'] as Map<String, dynamic>),
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
      lines:
          JournalReturnObject.fromJson(json['lines'] as Map<String, dynamic>),
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

TrackerEntry _$TrackerEntryFromJson(Map<String, dynamic> json) => TrackerEntry(
      label: json['label'] as String,
      currentValue: (json['currentValue'] as num).toInt(),
      minValue: (json['minValue'] as num?)?.toInt(),
      maxValue: (json['maxValue'] as num?)?.toInt(),
      trackerType: $enumDecode(_$TrackerTypesEnumMap, json['trackerType']),
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
      'trackerType': _$TrackerTypesEnumMap[instance.trackerType]!,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

const _$TrackerTypesEnumMap = {
  TrackerTypes.clock4: 'clock4',
  TrackerTypes.clock6: 'clock6',
  TrackerTypes.clock8: 'clock8',
  TrackerTypes.bar: 'bar',
  TrackerTypes.ironsworn1Troublesome: 'ironsworn1Troublesome',
  TrackerTypes.ironsworn2Dangerous: 'ironsworn2Dangerous',
  TrackerTypes.ironsworn3Formidable: 'ironsworn3Formidable',
  TrackerTypes.ironsworn4Extreme: 'ironsworn4Extreme',
  TrackerTypes.ironsworn5Epic: 'ironsworn5Epic',
  TrackerTypes.pips: 'pips',
  TrackerTypes.value: 'value',
  TrackerTypes.counter: 'counter',
  TrackerTypes.fate_aspect: 'fate_aspect',
};

NewSceneEntry _$NewSceneEntryFromJson(Map<String, dynamic> json) =>
    NewSceneEntry(
      label: json['label'] as String,
    )
      ..isFavourite = json['isFavourite'] as bool?
      ..id = json['id'] as String
      ..type = $enumDecode(_$JournalEntryTypesEnumMap, json['type']);

Map<String, dynamic> _$NewSceneEntryToJson(NewSceneEntry instance) =>
    <String, dynamic>{
      'isFavourite': instance.isFavourite,
      'id': instance.id,
      'label': instance.label,
      'type': _$JournalEntryTypesEnumMap[instance.type]!,
    };

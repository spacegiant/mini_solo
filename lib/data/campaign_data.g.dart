// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      diceActive: json['diceActive'] as bool,
      showMechanics: json['showMechanics'] as bool,
      useJournal: json['useJournal'] as bool,
      useRegularDice: json['useRegularDice'] as bool,
      useZocchiDice: json['useZocchiDice'] as bool,
      useFateDice: json['useFateDice'] as bool,
      useCoriolisDice: json['useCoriolisDice'] as bool,
      useT2KDice: json['useT2KDice'] as bool,
      useAchtungCthulhuDice: json['useAchtungCthulhuDice'] as bool,
      useD6Oracle: json['useD6Oracle'] as bool,
      wrapDiceControls: json['wrapDiceControls'] as bool,
      hiddenEntryTypes: (json['hiddenEntryTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$JournalEntryTypesEnumMap, e))
          .toList(),
      randomTableRecursionLimit:
          (json['randomTableRecursionLimit'] as num).toInt(),
    );

Map<String, dynamic> _$GeneralSettingsDataToJson(
        GeneralSettingsData instance) =>
    <String, dynamic>{
      'showFutureSettings': instance.showFutureSettings,
      'diceActive': instance.diceActive,
      'showMechanics': instance.showMechanics,
      'useJournal': instance.useJournal,
      'useZocchiDice': instance.useZocchiDice,
      'useRegularDice': instance.useRegularDice,
      'useFateDice': instance.useFateDice,
      'useCoriolisDice': instance.useCoriolisDice,
      'useT2KDice': instance.useT2KDice,
      'useAchtungCthulhuDice': instance.useAchtungCthulhuDice,
      'useD6Oracle': instance.useD6Oracle,
      'wrapDiceControls': instance.wrapDiceControls,
      'hiddenEntryTypes': instance.hiddenEntryTypes
          .map((e) => _$JournalEntryTypesEnumMap[e]!)
          .toList(),
      'randomTableRecursionLimit': instance.randomTableRecursionLimit,
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
      rollTableResults: (json['rollTableResults'] as List<dynamic>)
          .map((e) => RollTableResults.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracker: (json['tracker'] as List<dynamic>)
          .map((e) => TrackerEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      newScene: (json['newScene'] as List<dynamic>)
          .map((e) => NewSceneEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      groups: (json['groups'] as List<dynamic>)
          .map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      kards: (json['kards'] as List<dynamic>)
          .map((e) => Kard.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultEntries: (json['resultEntries'] as List<dynamic>)
          .map((e) => ResultEntries.fromJson(e as Map<String, dynamic>))
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
      'rollTableResults':
          instance.rollTableResults.map((e) => e.toJson()).toList(),
      'tracker': instance.tracker.map((e) => e.toJson()).toList(),
      'newScene': instance.newScene.map((e) => e.toJson()).toList(),
      'groups': instance.groups.map((e) => e.toJson()).toList(),
      'kards': instance.kards.map((e) => e.toJson()).toList(),
      'resultEntries': instance.resultEntries.map((e) => e.toJson()).toList(),
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

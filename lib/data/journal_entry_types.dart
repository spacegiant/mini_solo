class EntryTypeData {
  final String identifier;
  final String label;

  EntryTypeData({
    required this.identifier,
    required this.label,
  });
}

enum JournalEntryTypes {
  action,
  chaosFactor,
  // dialogue,
  fateCheck,
  mythic,
  newClue,
  newCreature,
  newEntity,
  newFaction,
  newPerson,
  newPlace,
  newScene,
  newThing,
  note,
  oracle,
  outcome,
  roll,
  // transition,
  scratchPage,
  randomTable,
  rollTableResults,
  tracker,
  kard,
  actionList,
  resultEntry,
}

Map<JournalEntryTypes, EntryTypeData> journalEntryTypeLabel = {
  JournalEntryTypes.chaosFactor: EntryTypeData(
    identifier: 'chaosFactor',
    label: 'Chaos Factor',
  ),
  // JournalEntryTypes.dialogue: EntryTypeData(identifier: 'dialogue', label: 'Dialogue',),
  JournalEntryTypes.mythic: EntryTypeData(
    identifier: 'mythic',
    label: 'Mythic',
  ),
  JournalEntryTypes.newClue: EntryTypeData(
    identifier: 'newClue',
    label: 'New Clue',
  ),
  JournalEntryTypes.newCreature: EntryTypeData(
    identifier: 'newCreature',
    label: 'New Creature',
  ),
  JournalEntryTypes.newEntity: EntryTypeData(
    identifier: 'newEntity',
    label: 'New Entity',
  ),
  JournalEntryTypes.newFaction: EntryTypeData(
    identifier: 'newFaction',
    label: 'New Faction',
  ),
  JournalEntryTypes.newPerson: EntryTypeData(
    identifier: 'newPerson',
    label: 'New Person',
  ),
  JournalEntryTypes.newPlace: EntryTypeData(
    identifier: 'newPlace',
    label: 'New Place',
  ),
  JournalEntryTypes.newScene: EntryTypeData(
    identifier: 'newScene',
    label: 'New Scene',
  ),
  JournalEntryTypes.newThing: EntryTypeData(
    identifier: 'newThing',
    label: 'New Thing',
  ),
  JournalEntryTypes.note: EntryTypeData(
    identifier: 'note',
    label: 'Note',
  ),
  JournalEntryTypes.oracle: EntryTypeData(
    identifier: 'oracle',
    label: 'Oracle',
  ),
  JournalEntryTypes.roll: EntryTypeData(
    identifier: 'roll',
    label: 'Roll',
  ),
  JournalEntryTypes.randomTable: EntryTypeData(
    identifier: 'randomTable',
    label: 'Random Table',
  ),
  JournalEntryTypes.rollTableResults: EntryTypeData(
    identifier: 'rollTableResult',
    label: 'Roll Table Result',
  ),
  JournalEntryTypes.scratchPage: EntryTypeData(
    identifier: 'scratchPage',
    label: 'Scratch Page',
  ),
  // JournalEntryTypes.transition: EntryTypeData(identifier: 'transition', label: 'Transition',),
  JournalEntryTypes.tracker: EntryTypeData(
    identifier: 'tracker',
    label: 'Tracker',
  ),
  JournalEntryTypes.actionList: EntryTypeData(
    identifier: 'actionList',
    label: 'Action List',
  ),
  JournalEntryTypes.kard: EntryTypeData(
    identifier: 'kard',
    label: 'Card',
  ),
};

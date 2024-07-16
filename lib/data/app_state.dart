import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/campaign_storage.dart';
import 'package:mini_solo/data/result_entries.dart';
import 'package:mini_solo/features/grouping/group.dart';

import '../features/kard/kard.dart';
import '../features/trackers/tracker_options.dart';
import '../utilities/string/convert_to_filename.dart';
import 'data_structures/clue.dart';
import 'data_structures/creature.dart';
import 'data_structures/faction.dart';
import 'data_structures/journal_entry.dart';
import 'data_structures/journal_entry_item.dart';
import 'data_structures/mythic_entry.dart';
import 'data_structures/new_scene_entry.dart';
import 'data_structures/oracle_entry.dart';
import 'data_structures/person.dart';
import 'data_structures/place.dart';
import 'data_structures/roll_entry_item.dart';
import 'data_structures/scratch_page_entry_item.dart';
import 'data_structures/thing.dart';
import 'data_structures/tracker_entry.dart';
import 'journal_entry_types.dart';
import 'note_entry_item.dart';

enum PopupLabel {
  addJournalEntry,
  addRandomTable,
  campaignManager,
  chaos,
  editField,
  editNote,
  editMythicEntry,
  editNewSceneEntry,
  editOracleEntry,
  editRoll,
  fullJournal,
  journalFilter,
  editRandomTable,
  editRollTableResult,
  importManager,
  createTracker,
  editTracker,
  addGroup,
  editGroup,
}

class AppState extends ChangeNotifier {
  // TODO: Make sure this is not set on first run
  late CampaignStorage _storage;
  late final PopupLabel _popupLabel = PopupLabel.chaos;
  late final bool _showPopup = false;
  late bool _showSettings = false;
  CampaignData? _campaignData;
  late AppSettingsData _appSettingsData = initAppSettingsData();
  Function(String)? _deleteCampaignCallback;
  int get chaosFactor => _campaignData!.mythicData.chaosFactor;
  int maxChaos = 9;
  int minChaos = 1;

  // GROUPS
  List<Group> get groupList => _campaignData!.groups;

  bool entityExists(String id) {
    RandomTable? randomTableEntry = getRandomTableById(id);
    TrackerEntry? trackerEntry = getTrackerEntryById(id);
    ActionListEntry? actionListEntry = getActionListById(id);

    return randomTableEntry == null &&
        trackerEntry == null &&
        actionListEntry == null;
  }

  void deleteEntityById(String id) {
    appSettingsData.randomTables.removeWhere((entry) => entry.id == id);
    appSettingsData.actionLists.removeWhere((entry) => entry.id == id);
    campaignData?.tracker.removeWhere((entry) => entry.id == id);
  }

  bool groupExists(String groupName) {
    int index = _campaignData!.groups.indexWhere((group) {
      return group.label == groupName;
    });
    return index > -1;
  }

  Group getGroup(String groupName) {
    return campaignData!.groups.firstWhere((group) {
      return group.groupId == groupName;
    });
  }

  String? createNewGroup(Group group) {
    if (groupExists(group.label)) {
      return 'Already a group';
    } else {
      _campaignData!.groups.add(group);
      saveCampaignDataToDisk();
      // return null;
    }
    return null;
  }

  void addToGroup({required String controlId, required String groupId}) {
    _campaignData!.groups
        .firstWhere((group) => group.groupId == groupId)
        .controls
        .add(controlId);
  }

  void removeFromAllGroups({
    required String controlId,
  }) {
    _campaignData?.groups.forEach((group) {
      group.controls.remove(controlId);
    });
  }

  void moveToGroup({
    required String controlId,
    required String groupId,
    bool? save = true,
  }) {
    removeFromAllGroups(controlId: controlId);
    addToGroup(controlId: controlId, groupId: groupId);

    // Can get error when it's trying to save too much.
    // This function is low risk, so we can move the items
    // and the app can wait until something else saves to
    // keep the changes. If changes are lost, it will just
    // run it again at some point.
    if (save == true) saveCampaignDataToDisk();
  }

  String? findCurrentGroupId(String entryId) {
    String? currentGroupId;

    for (var group in _campaignData!.groups) {
      if (group.controls.contains(entryId)) {
        currentGroupId = group.groupId;
      }
    }

    return currentGroupId;
  }

  void deleteGroup(String groupName) {
    // _appSettingsData.groups.remove(groupName);
  }

  void renameGroup(String groupName, String newGroupName) {
    // Add the newGroupName
    // Update all the place that have the old name to new name
    // Delete the old name
  }

  void moveGroup(String groupName, String? beforeGroupName) {
    // Find beforeGroupName
    // (if beforeGroupName is not null) Move groupName before beforeGroupName
    // (if beforeGroupName is null) move to end
  }

  void updateGroup({
    required String groupID,
    String? label,
    required List<String> controls,
    required bool isWrapped,
  }) {
    Group group =
        campaignData!.groups.firstWhere((group) => group.groupId == groupID);
    if (label != null) group.label = label;
    group.controls = controls;
    group.isWrapped = isWrapped;
    saveCampaignDataToDisk();
  }

  void updateGroups({required List<Group> groups}) {
    campaignData!.groups = groups;
    saveCampaignDataToDisk();
  }

  // LABELS

  String? createNewKard(Kard kard) {
    _campaignData!.kards.add(kard);
    addToGroup(controlId: kard.id, groupId: 'unsorted');
    saveCampaignDataToDisk();
    return null;
  }

  void deleteKard(String id) {
    removeFromAllGroups(controlId: id);
    _campaignData!.kards.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
  }

  Kard? getKardById(String id) {
    return campaignData?.kards.firstWhereOrNull((kard) => kard.id == id);
  }

  void updateKard({
    required String id,
    String? title,
    List<String>? lines,
    required KardLayoutTypes layoutType,
    required bool firstLineHeadings,
    required bool showHeading,
  }) {
    Kard? entry = getKardById(id);
    if (entry != null) {
      entry.title = title ?? '';
      entry.lines = lines ?? [];
      entry.layoutType = layoutType;
      entry.firstLineHeadings = firstLineHeadings;
      entry.showHeading = showHeading;
    }
    saveCampaignDataToDisk();
  }

  // EXPANDED LIST

  void toggleExpanded(String label) {
    _appSettingsData.expandedList.contains(label)
        ? _appSettingsData.expandedList.remove(label)
        : _appSettingsData.expandedList.add(label);
    saveAppSettingsDataToDisk();
    notifyListeners();
  }

  bool isExpanded(String label) {
    return !_appSettingsData.expandedList.contains(label);
  }

  // GROUP IS ACTIVE
  void toggleGroupIsActive(String id, bool? checked) {
    Group group = getGroup(id);
    group.isActive = checked ?? !group.isActive;
    saveCampaignDataToDisk();
  }

  // CAMPAIGN STORAGE
  void setCampaignStorage(CampaignStorage storage) {
    _storage = storage;
  }

  CampaignStorage get storage => _storage;

  // FUTURE FEATURES
  bool? get showFutureFeatures =>
      _campaignData?.settings.general.showFutureSettings;

  void toggleShowFutureFeatures() {
    _campaignData?.settings.general.showFutureSettings =
        !_campaignData!.settings.general.showFutureSettings;
    saveCampaignDataToDisk();
  }

  void toggleShowMechanics() {
    _campaignData!.settings.general.showMechanics =
        !_campaignData!.settings.general.showMechanics;
    saveCampaignDataToDisk();
  }

  bool get showMechanics => _campaignData!.settings.general.showMechanics;

  // SAVE CALLBACK

  // void setAppSettingsSaveCallback(cb) {
  //   _saveAppSettingsCallback = cb;
  // }

  void loadCampaign(String fileName) {
    _storage.readCampaignDataJSON(fileName).then((data) {
      if (data != null) {
        String campaignFileName = convertToFilename(data.name);
        setCampaignData(data);
        setCurrentCampaign(campaignFileName);
      }
    });
  }

  void saveCampaignDataToDisk([String? fileName]) {
    String name = fileName ?? _appSettingsData.currentCampaign;
    storage.writeJSON(_campaignData!, '$name.json');
    notifyListeners();
  }

  void saveAppSettingsDataToDisk() {
    storage.writeAppSettingsJSON(appSettingsData, '$kAppSettingsFileName.json');
    notifyListeners();
  }

  // CAMPAIGN DATA
  CampaignData? get campaignData {
    return _campaignData;
  }

  void setCampaignData(CampaignData data) {
    _campaignData = data;
    saveCampaignDataToDisk(data.filename);
    notifyListeners();
  }

  void setAppSettingsData(AppSettingsData data) {
    _appSettingsData = data;
    saveAppSettingsDataToDisk();
    notifyListeners();
  }

  AppSettingsData get appSettingsData {
    return _appSettingsData;
  }

  // CURRENT CAMPAIGN
  String? get currentCampaign => _appSettingsData.currentCampaign;

  void setCurrentCampaign(String campaignName) {
    _appSettingsData.currentCampaign = campaignName;
    saveAppSettingsDataToDisk();
  }

  void deleteCampaign(String filename) {
    storage.deleteCampaign(filename);
  }

  // CURRENT CAMPAIGN

  // CHAOS FACTOR
  void increaseChaosFactor() {
    var cf = chaosFactor;
    if (cf < maxChaos) {
      var newValue = cf + 1;
      _campaignData!.mythicData.chaosFactor = newValue;
      addMythicEntry(MythicEntry(
        isFavourite: false,
        lines: JournalEntry(
          type: 'chaosFactor',
          line1: 'Chaos Factor',
          result: 'UP to $newValue',
        ),
        label: 'Alter Chaos Factor',
      ));
    }
  }

  void decreaseChaosFactor() {
    var cf = chaosFactor;
    if (cf > minChaos) {
      var newValue = cf - 1;
      _campaignData!.mythicData.chaosFactor = newValue;
      addMythicEntry(MythicEntry(
        isFavourite: false,
        lines: JournalEntry(
          type: 'chaosFactor',
          line1: 'Chaos Factor',
          result: 'DOWN to $newValue',
        ),
        label: 'Alter Chaos Factor',
      ));
    }
  }

  void resetChaosFactor() {
    var newValue = 5;
    _campaignData!.mythicData.chaosFactor = newValue;
    addMythicEntry(MythicEntry(
      isFavourite: false,
      lines: JournalEntry(
        type: 'chaosFactor',
        line1: 'Chaos Factor',
        result: 'RESET to 5',
      ),
      label: 'Alter Chaos Factor',
    ));
  }

  // POPUPS
  PopupLabel get popupLabel => _popupLabel;

  bool get showPopup => _showPopup;

//   SETTINGS
  void toggleShowSettings() {
    _showSettings = !_showSettings;
    notifyListeners();
  }

  bool get showSettings => _showSettings;

  // WRAP CONTROLS
  bool get wrapDiceControls =>
      _campaignData?.settings.general.wrapDiceControls ?? false;

  void toggleWrapDiceControls(bool isWrapped) {
    _campaignData?.settings.general.wrapDiceControls = isWrapped;
    saveCampaignDataToDisk();
  }

  // GENERAL DICE
  bool? get useGeneralDice => _campaignData?.settings.general.useRegularDice;

  void toggleUseGeneralDice() {
    _campaignData?.settings.general.useRegularDice =
        !_campaignData!.settings.general.useRegularDice;
    saveCampaignDataToDisk();
  }

  // ZOCCHI DICE
  bool? get useZocchiDice => _campaignData?.settings.general.useZocchiDice;

  void toggleUseZocchiDice() {
    _campaignData?.settings.general.useZocchiDice =
        !_campaignData!.settings.general.useZocchiDice;
    saveCampaignDataToDisk();
  }

  // FATE DICE
  bool? get useFateDice => _campaignData?.settings.general.useFateDice;

  void toggleUseFateDice() {
    _campaignData?.settings.general.useFateDice =
        !_campaignData!.settings.general.useFateDice;
    saveCampaignDataToDisk();
  }

  // CORIOLIS DICE
  bool? get useCoriolisDice => _campaignData?.settings.general.useCoriolisDice;

  void toggleUseCoriolisDice() {
    _campaignData?.settings.general.useCoriolisDice =
        !_campaignData!.settings.general.useCoriolisDice;
    saveCampaignDataToDisk();
  }

  // TWILITGHT 2000 DICE
  bool? get useT2KDice => _campaignData?.settings.general.useT2KDice;

  void toggleUseT2KDice() {
    _campaignData?.settings.general.useT2KDice =
        !_campaignData!.settings.general.useT2KDice;
    saveCampaignDataToDisk();
  }

  // ACHTUNG! CTHULHU DICE
  bool? get useAchtungCthulhuDice =>
      _campaignData?.settings.general.useAchtungCthulhuDice;

  void toggleUseAchtungCthulhuDice() {
    _campaignData?.settings.general.useAchtungCthulhuDice =
        !_campaignData!.settings.general.useAchtungCthulhuDice;
    saveCampaignDataToDisk();
  }

  // D6 ORACLE DICE
  bool? get useD6Oracle => _campaignData?.settings.general.useD6Oracle;

  void toggleUseD6Oracle() {
    _campaignData?.settings.general.useD6Oracle =
        !_campaignData!.settings.general.useD6Oracle;
    saveCampaignDataToDisk();
  }

  // JOURNAL ENTRIES
  void addJournalEntry(JournalEntryItem item) {
    _campaignData?.journal.add(item);
    // THIS SAVES FOR ALL ENTRY TYPES
    saveCampaignDataToDisk();
  }

  // NEW SCENE ENTRIES
  void addNewScene(NewSceneEntry entry) {
    _campaignData!.newScene.add(entry);

    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: JournalEntryTypes.newScene,
        id: entry.id,
      ),
    );
  }

  void updateNewScene(String id, String newLabel) {
    int index = _campaignData!.newScene.indexWhere((entry) => entry.id == id);

    _campaignData?.newScene[index].label = newLabel;
    saveCampaignDataToDisk();
  }

  void deleteNewSceneEntry(String id) {
    _campaignData!.newScene.removeWhere((entry) => entry.id == id);
    _campaignData!.journal.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
  }

  // PERSON ENTRIES
  void addPerson(Person person) {
    _campaignData?.people.add(person);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: person.type,
        id: person.id,
      ),
    );
  }

  // PLACE ENTRIES
  void addPlace(Place place) {
    _campaignData?.places.add(place);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: place.type,
        id: place.id,
      ),
    );
  }

  // THING ENTRIES
  void addThing(Thing thing) {
    _campaignData?.things.add(thing);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: thing.type,
        id: thing.id,
      ),
    );
  }

  // FACTION ENTRIES
  void addFaction(Faction faction) {
    _campaignData?.factions.add(faction);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: faction.type,
        id: faction.id,
      ),
    );
  }

  // CLUE ENTRIES
  void addClue(Clue clue) {
    _campaignData?.clues.add(clue);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: clue.type,
        id: clue.id,
      ),
    );
  }

  // CREATURE ENTRIES
  void addCreature(Creature creature) {
    _campaignData?.creatures.add(creature);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: creature.type,
        id: creature.id,
      ),
    );
  }

  // ROLL ENTRIES
  void addRollEntry(RollEntryItem roll) {
    _campaignData?.rolls.add(roll);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: roll.type,
        id: roll.id,
      ),
    );
  }

  void deleteRollEntry(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == id);
    _campaignData!.rolls.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
    // notifyListeners();
  }

  // NOTE ENTRIES
  void addNoteItem(NoteEntryItem noteEntryItem) {
    _campaignData?.notes.add(noteEntryItem);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: noteEntryItem.type,
        id: noteEntryItem.id,
      ),
    );
  }

  void updateNoteItem(String id, String detail) {
    int index = _campaignData!.notes.indexWhere((entry) => entry.id == id);

    _campaignData?.notes[index].detail = detail;
    saveCampaignDataToDisk();
  }

  void deleteNoteItem(String entryId) {
    _campaignData!.journal.removeWhere((entry) => entry.id == entryId);
    _campaignData!.notes.removeWhere((entry) => entry.id == entryId);
    saveCampaignDataToDisk();
    // notifyListeners();
  }

  // ORACLE ENTRY
  void addOracleEntry(OracleEntry oracleEntry) {
    _campaignData?.oracle.add(oracleEntry);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: oracleEntry.type,
        id: oracleEntry.id,
      ),
    );
  }

  void deleteOracleEntry(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == id);
    _campaignData!.oracle.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
  }

  // MYTHIC ENTRY
  void addMythicEntry(MythicEntry mythicEntry) {
    _campaignData?.mythic.add(mythicEntry);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: mythicEntry.type,
        id: mythicEntry.id,
      ),
    );
  }

  void deleteMythicEntry(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == id);
    _campaignData!.mythic.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
  }

  // SCRATCH PAD

  void setCurrentScratchId(String id) {
    _campaignData?.currentScratchEntryId = id;
    saveCampaignDataToDisk();
  }

  get currentScratchId => _campaignData?.currentScratchEntryId;

  void addScratchPadEntry(ScratchPageEntryItem scratchPadEntry) {
    _campaignData?.scratchPad.add(scratchPadEntry);
    _campaignData?.currentScratchEntryId = scratchPadEntry.id;

    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: scratchPadEntry.type,
        id: scratchPadEntry.id,
      ),
    );
  }

  ScratchPageEntryItem? findScratchPadEntryItem(String id) {
    return _campaignData?.scratchPad.firstWhere((entry) => entry.id == id);
  }

  void updateScratchPadEntryItem({
    required String id,
    required String title,
    required String text,
  }) {
    int index = _campaignData!.scratchPad.indexWhere((entry) => entry.id == id);

    _campaignData?.scratchPad[index].title = title;
    _campaignData?.scratchPad[index].text = text;
    saveCampaignDataToDisk();
  }

  void deleteScratchPadEntry(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == id);
    _campaignData!.scratchPad.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
  }

  //   RANDOM TABLES
  void addRandomTable(RandomTable entry) {
    _appSettingsData.randomTables.add(entry);
    notifyListeners();
  }

  List<RandomTable> get randomTables => _appSettingsData.randomTables;

  void deleteRandomTable(String id) {
    removeFromAllGroups(controlId: id);
    // remove from all random table other links
    removeLinkFromAllRandomTables(id);
    removeLinkFromAllActionLists(id);
    _appSettingsData.randomTables.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
    saveAppSettingsDataToDisk();
  }

  RandomTable? getRandomTableById(String id) {
    return appSettingsData.randomTables
        .firstWhereOrNull((entry) => entry.id == id);
  }

  void removeLinkFromAllRandomTables(String id) {
    for (var table in appSettingsData.randomTables) {
      table.rows
          .firstWhereOrNull((row) => row.otherRandomTable == id)
          ?.otherRandomTable = null;
    }
  }

  void updateRandomTable({
    required String id,
    // required RandomTable entry,
    String? title,
    List<RandomTableRow>? rows,
    bool? isFavourite,
    bool? showLinkOptions,
  }) {
    int index =
        _appSettingsData.randomTables.indexWhere((entry) => entry.id == id);
    var randomTable = _appSettingsData.randomTables[index];

    print('>> $title');

    if (title != null) randomTable.title = title;
    if (rows != null) randomTable.rows = rows;
    if (isFavourite != null) randomTable.isFavourite = isFavourite;
    if (showLinkOptions != null) randomTable.showLinkOptions = showLinkOptions;

    saveAppSettingsDataToDisk();
  }

  void randomTableToggleHidden(bool value) {}

  // RANDOM TABLE ENTRIES
  void addRandomTableResultsEntry(RollTableResults entry) {
    _campaignData?.rollTableResults.add(entry);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: entry.type,
        id: entry.id,
      ),
    );
  }

  void updateRandomTableResultsEntry(String id, RollTableResults entry) {
    int index =
        _campaignData!.rollTableResults.indexWhere((entry) => entry.id == id);

    _campaignData?.rollTableResults[index] = entry;
    saveCampaignDataToDisk();
  }

  void deleteRandomTableResultsEntry(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == id);
    _campaignData!.rollTableResults.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
    // notifyListeners();
  }

  // ACTION LIST ENTRIES

  List<ActionListEntry> get actionLists => _appSettingsData.actionLists;

  void addActionList(ActionListEntry entry) {
    _appSettingsData.actionLists.add(entry);
    saveAppSettingsDataToDisk();
  }

  ActionListEntry? getActionListById(String id) {
    return appSettingsData.actionLists
        .firstWhereOrNull((entry) => entry.id == id);
  }

  void deleteActionList(String id) {
    removeFromAllGroups(controlId: id);
    removeLinkFromAllActionLists(id);
    _appSettingsData.actionLists.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
    saveAppSettingsDataToDisk();
  }

  void updateActionList({
    required String id,
    required String title,
    required List<ActionRow> list,
    bool? isActive,
    bool? isHidden,
  }) {
    int index =
        _appSettingsData.actionLists.indexWhere((entry) => entry.id == id);

    _appSettingsData.actionLists[index].title = title;
    _appSettingsData.actionLists[index].list = list;
    if (isActive != null) {
      _appSettingsData.actionLists[index].isActive = isActive;
    }
    if (isHidden != null) {
      _appSettingsData.actionLists[index].isHidden = isHidden;
    }
    saveAppSettingsDataToDisk();
  }

  void addResultEntry(ResultEntries entry) {
    _campaignData?.resultEntries.add(entry);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: JournalEntryTypes.resultEntry,
        id: entry.id,
      ),
    );
  }

  void deleteResultEntry(String id) {
    _campaignData?.journal.removeWhere((entry) => entry.id == id);
    saveAppSettingsDataToDisk();
  }

  void removeLinkFromAllActionLists(String id) {
    for (var table in appSettingsData.actionLists) {
      table.list.removeWhere((item) => item.string == id);
    }
  }

  // ActionListEntry getActionListById(String id) {
  //   return appSettingsData.actionLists.firstWhere((entry) => entry.id == id);
  // }

  // TRACKER ENTRIES
  void addTrackerEntry(TrackerEntry entry) {
    _campaignData?.tracker.add(entry);
    saveCampaignDataToDisk();
  }

  TrackerEntry? getTrackerEntryById(String id) {
    return campaignData!.tracker.firstWhereOrNull((entry) => entry.id == id);
  }

  void updateTrackerEntry({
    required String id,
    String? label,
    int? currentValue,
    int? minValue,
    int? maxValue,
  }) {
    int index = _campaignData!.tracker.indexWhere((entry) => entry.id == id);

    if (label != null) _campaignData?.tracker[index].label = label;
    if (currentValue != null) {
      _campaignData?.tracker[index].currentValue = currentValue;
    }
    if (maxValue != null) _campaignData?.tracker[index].maxValue = maxValue;
    if (minValue != null) _campaignData?.tracker[index].minValue = minValue;

    saveCampaignDataToDisk();
  }

  void deleteTrackerEntry(String id) {
    removeFromAllGroups(controlId: id);
    _campaignData!.tracker.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
    // notifyListeners();
  }

  // HIDE ENTRY TYPES

  List<JournalEntryTypes>? get hiddenEntryTypes =>
      campaignData?.settings.general.hiddenEntryTypes;

  void toggleJournalEntryTypeVisibility(
    JournalEntryTypes type,
  ) {
    bool? isChecked =
        campaignData?.settings.general.hiddenEntryTypes.contains(type);
    if (isChecked == true) {
      campaignData?.settings.general.hiddenEntryTypes.remove(type);
    } else {
      campaignData?.settings.general.hiddenEntryTypes.add(type);
    }
    notifyListeners();
    saveCampaignDataToDisk();
  }
}

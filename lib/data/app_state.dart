import 'package:flutter/cupertino.dart';
import 'package:mini_solo/constants.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/data/campaign_storage.dart';

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
}

class AppState extends ChangeNotifier {
  // TODO: Make sure this is not set on first run
  late CampaignStorage _storage;
  late PopupLabel _popupLabel = PopupLabel.chaos;
  late bool _showPopup = false;
  late bool _showSettings = false;
  // TODO: Remove _useJournal
  late bool _useJournal = true;
  CampaignData? _campaignData;
  late AppSettingsData _appSettingsData = initAppSettingsData();
  Function(AppSettingsData)? _saveAppSettingsCallback;
  Function(String)? _deleteCampaignCallback;
  int get chaosFactor => _campaignData!.mythicData.chaosFactor;
  int maxChaos = 9;
  int minChaos = 1;
  String _currentEntryId = '';

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
    _storage.readJSON(fileName).then((data) {
      if (data != null) {
        setCampaignData(data);
        setCurrentCampaign(data.name);
      }
    });
  }

  void saveCampaignDataToDisk([String? fileName]) {
    String name = fileName ?? _appSettingsData.currentCampaign;
    storage.writeJSON(_campaignData!, '$name.json');
    notifyListeners();
  }

  Function(AppSettingsData)? get appSettingsSaveCallback =>
      _saveAppSettingsCallback;

  void saveAppSettingsDataToDisk() {
    storage.writeAppSettingsJSON(appSettingsData, '$kAppSettingsFileName.json');
  }

  // CAMPAIGN DATA
  CampaignData? get campaignData {
    return _campaignData;
  }

  void setCampaignData(CampaignData data) {
    _campaignData = data;
    saveCampaignDataToDisk(data.name);
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
    // _currentCampaign = campaignName;
    _appSettingsData.currentCampaign = campaignName;
    notifyListeners();
  }

  void setDeleteCampaignCallback(cb) {
    _deleteCampaignCallback = cb;
  }

  get deleteCampaign => _deleteCampaignCallback;

  // CURRENT CAMPAIGN

  void setCurrentEntryId(String id) {
    _currentEntryId = id;
    // TODO: Does this need notify listeners?
  }

  get currentEntryId => _currentEntryId;

  // CHAOS FACTOR
  void increaseChaosFactor() {
    var cf = chaosFactor;
    if (cf < maxChaos) {
      var newValue = cf + 1;
      _campaignData!.mythicData.chaosFactor = newValue;
      addMythicEntry(MythicEntry(
        isFavourite: false,
        lines: JournalReturnObject(
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
        lines: JournalReturnObject(
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
      lines: JournalReturnObject(
        type: 'chaosFactor',
        line1: 'Chaos Factor',
        result: 'RESET to 5',
      ),
      label: 'Alter Chaos Factor',
    ));
  }

  // POPUPS
  PopupLabel get popupLabel => _popupLabel;

  void toggleShowPopup({
    PopupLabel? label,
    Function()? callback,
  }) {
    if (label != null) _popupLabel = label;
    if (callback != null) callback();
    _showPopup = !_showPopup;
    notifyListeners();
  }

  void closePopup() {
    if (_showPopup == true) {
      _showPopup = false;
      _currentEntryId = '';
      notifyListeners();
    }
  }

  bool get showPopup => _showPopup;

//   SETTINGS
  void toggleShowSettings() {
    _showSettings = !_showSettings;
    notifyListeners();
  }

  bool get showSettings => _showSettings;

//   USE JOURNAL
  bool get useJournal => _useJournal;

  void toggleUseJournal() {
    _useJournal = !_useJournal;
    notifyListeners();
  }

  // WRAP CONTROLS
  bool get wrapControls =>
      _campaignData?.settings.general.wrapControls ?? false;

  void toggleWrapControls() {
    _campaignData?.settings.general.wrapControls =
        !_campaignData!.settings.general.wrapControls;
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
  // NOTE: This just adds a marker for a new scene.
  void addNewScene() {
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: JournalEntryTypes.newScene,
        id: 'new scene marker',
      ),
    );
  }

  void deleteNewSceneEntry(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == currentEntryId);
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
    _campaignData!.journal.removeWhere((entry) => entry.id == currentEntryId);
    _campaignData!.rolls.removeWhere((entry) => entry.id == currentEntryId);
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
    int index =
        _campaignData!.notes.indexWhere((entry) => entry.id == currentEntryId);

    _campaignData?.notes[index].detail = detail;
    saveCampaignDataToDisk();
  }

  void deleteNoteItem(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == currentEntryId);
    _campaignData!.notes.removeWhere((entry) => entry.id == currentEntryId);
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
    _campaignData!.journal.removeWhere((entry) => entry.id == currentEntryId);
    _campaignData!.oracle.removeWhere((entry) => entry.id == currentEntryId);
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
    _campaignData!.journal.removeWhere((entry) => entry.id == currentEntryId);
    _campaignData!.mythic.removeWhere((entry) => entry.id == currentEntryId);
    saveCampaignDataToDisk();
  }

  // SCRATCH PAD

  void setCurrentScratchId(String id) {
    _campaignData?.currentScratchEntryId = id;
    saveCampaignDataToDisk();
    notifyListeners();
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
  void addRandomTable(RandomTableEntry entry) {
    _appSettingsData.randomTables.add(entry);
    appSettingsSaveCallback!(_appSettingsData);
    notifyListeners();
  }

  List<RandomTableEntry> get randomTables => _appSettingsData.randomTables;

  void deleteRandomTable(String id) {
    _appSettingsData.randomTables.removeWhere((entry) => entry.id == id);
    // saveCampaignDataToDisk();
    appSettingsSaveCallback!(_appSettingsData);
    notifyListeners();
  }

  // RANDOM TABLE ENTRIES
  void addRandomTableResultsEntry(RollTableResult entry) {
    _campaignData?.rollTableResult.add(entry);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: entry.type,
        id: entry.id,
      ),
    );
  }

  void updateRandomTableResultsEntry(String id, RollTableResult entry) {
    int index = _campaignData!.rollTableResult
        .indexWhere((entry) => entry.id == currentEntryId);

    _campaignData?.rollTableResult[index] = entry;
    saveCampaignDataToDisk();
  }

  void deleteRandomTableResultsEntry(String id) {
    _campaignData!.journal.removeWhere((entry) => entry.id == id);
    _campaignData!.rollTableResult.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
    // notifyListeners();
  }

  // TRACKER ENTRIES
  void addTrackerEntry(TrackerEntry entry) {
    _campaignData?.tracker.add(entry);

    // Tracker and journal entry do not need to be linked - just add note
    NoteEntryItem note = NoteEntryItem(
      isFavourite: false,
      detail: entry.label,
    );

    _campaignData?.notes.add(note);

    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: JournalEntryTypes.note,
        id: note.id,
      ),
    );
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
    // _campaignData!.journal.removeWhere((entry) => entry.id == id);
    _campaignData!.tracker.removeWhere((entry) => entry.id == id);
    saveCampaignDataToDisk();
    // notifyListeners();
  }
}

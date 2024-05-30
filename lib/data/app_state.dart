import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/app_settings_data.dart';
import 'package:mini_solo/data/campaign_data.dart';

import 'note_entry_item.dart';

// FIXME: Rename to PopupLabel
enum PopupLabels {
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
}

class AppState extends ChangeNotifier {
  // TODO: Make sure this is not set on first run
  late PopupLabels _popupLabel = PopupLabels.chaos;
  late bool _showPopup = false;
  late bool _showSettings = false;
  late bool _useJournal = true;
  CampaignData? _campaignData;
  late AppSettingsData _appSettingsData = initAppSettingsData();
  Function(CampaignData)? _saveCallback;
  Function(AppSettingsData)? _saveAppSettingsCallback;
  Function(String)? _deleteCampaignCallback;
  int get chaosFactor => _campaignData!.mythicData.chaosFactor;
  int maxChaos = 9;
  int minChaos = 1;
  String _currentEntryId = '';

  // FUTURE FEATURES
  bool? get showFutureFeatures =>
      _campaignData?.settings.general.showFutureSettings;

  void toggleShowFutureFeatures() {
    _campaignData?.settings.general.showFutureSettings =
        !_campaignData!.settings.general.showFutureSettings;
    saveCampaignDataToDisk();
  }

  // SAVE CALLBACK
  // TODO: Rename to setSaveCampaignCallback
  void setSaveCallback(cb) {
    _saveCallback = cb;
  }

  void setAppSettingsSaveCallback(cb) {
    _saveAppSettingsCallback = cb;
  }

  void saveCampaignDataToDisk() {
    if (_saveCallback != null) _saveCallback!(_campaignData!);
    notifyListeners();
  }

  Function(AppSettingsData)? get appSettingsSaveCallback =>
      _saveAppSettingsCallback;

  void saveAppSettingsDataToDisk() {}

  bool get saveCallbackExists => _saveCallback != null;

  // CAMPAIGN DATA
  CampaignData? get campaignData {
    return _campaignData;
  }

  void setCampaignData(CampaignData data) {
    _campaignData = data;
    _appSettingsData.currentCampaign = data.name;
    notifyListeners();
  }

  void setAppSettingsData(AppSettingsData data) {
    _appSettingsData = data;
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
        lines: ReturnObject(
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
        lines: ReturnObject(
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
      lines: ReturnObject(
        type: 'chaosFactor',
        line1: 'Chaos Factor',
        result: 'RESET to 5',
      ),
      label: 'Alter Chaos Factor',
    ));
  }

  // POPUPS
  PopupLabels get popupLabel => _popupLabel;

  void toggleShowPopup({
    PopupLabels? label,
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
    AppSettingsData data = _appSettingsData;
    appSettingsSaveCallback!(data);
  }

  List<RandomTableEntry> get randomTables => _appSettingsData.randomTables;

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
    _campaignData!.rollTableResult
        .removeWhere((entry) => entry.id == currentEntryId);
    _campaignData!.notes.removeWhere((entry) => entry.id == currentEntryId);
    saveCampaignDataToDisk();
    // notifyListeners();
  }
}

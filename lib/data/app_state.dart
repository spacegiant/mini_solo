import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';

import 'note_entry_item.dart';

enum PopupLabels {
  addJournalEntry,
  campaignManager,
  chaos,
  combat,
  editField,
  editNote,
  endScene,
  exploration,
  fate,
  fullJournal,
  investigation,
  journalFilter,
  social,
  travel,
}

class AppState extends ChangeNotifier {
  // TODO: Make sure this is not set on first run
  String? _currentCampaign;
  late PopupLabels _popupLabel = PopupLabels.chaos;
  late bool _showPopup = false;
  late bool _showSettings = false;
  late bool _useJournal = true;
  CampaignData? _campaignData;
  Function(CampaignData)? _saveCallback;
  Function(String)? _deleteCampaignCallback;
  int get chaosFactor => _campaignData!.mythicData.chaosFactor;
  int maxChaos = 9;
  int minChaos = 1;

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

  void saveCampaignDataToDisk() {
    if (_saveCallback != null) _saveCallback!(_campaignData!);
    notifyListeners();
  }

  bool get saveCallbackExists => _saveCallback != null;

  // CAMPAIGN DATA
  CampaignData? get campaignData {
    return _campaignData;
  }

  void setCampaignData(CampaignData data) {
    _campaignData = data;
    _currentCampaign = data.name;
    notifyListeners();
  }

  // CURRENT CAMPAIGN
  String? get currentCampaign => _currentCampaign;

  void setCurrentCampaign(String campaignName) {
    _currentCampaign = campaignName;
    notifyListeners();
  }

  void setDeleteCampaignCallback(cb) {
    _deleteCampaignCallback = cb;
  }

  get deleteCampaign => _deleteCampaignCallback;

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

  // ZOCCHI DICE
  bool get wrapControls =>
      _campaignData?.settings.general.wrapControls ?? false;

  void toggleWrapControls() {
    _campaignData?.settings.general.wrapControls =
        !_campaignData!.settings.general.wrapControls;
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

  // JOURNAL ENTRIES
  void addJournalEntry(JournalEntryItem item) {
    _campaignData?.journal.add(item);
    // THIS SAVES FOR ALL ENTRY TYPES
    saveCampaignDataToDisk();
  }

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

  void addRoll(RollEntryItem roll) {
    _campaignData?.rolls.add(roll);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: roll.type,
        id: roll.id,
      ),
    );
  }

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
}

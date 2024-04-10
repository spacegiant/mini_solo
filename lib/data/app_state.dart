import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';

import 'generic_entry_item.dart';

enum PopupLabels {
  chaos,
  fate,
  endScene,
  combat,
  social,
  exploration,
  investigation,
  journalFilter,
  travel,
  addJournalEntry,
  campaignManager,
  fullJournal,
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
  int get chaosFactor => _campaignData!.mythic.chaosFactor;
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

  // CHAOS FACTOR
  void increaseChaosFactor() {
    var cf = chaosFactor;
    if (cf < maxChaos) {
      var newValue = cf + 1;
      _campaignData!.mythic.chaosFactor = newValue;
      addGenericEntity(GenericEntryItem(
        title: 'UP to $newValue',
        label: 'Chaos Factor',
        isFavourite: false,
      ));
    }
  }

  void decreaseChaosFactor() {
    var cf = chaosFactor;
    if (cf > minChaos) {
      var newValue = cf - 1;
      _campaignData!.mythic.chaosFactor = newValue;
      // TODO: CREATE ID
      // TODO: SAVE GENERIC ENTRY
      // TODO: SAVE JOURNAL ENTRY
      addGenericEntity(GenericEntryItem(
        title: 'DOWN to $newValue',
        label: 'Chaos Factor',
        isFavourite: false,
      ));
    }
    // saveCampaignDataToDisk();
  }

  void resetChaosFactor() {
    var newValue = 5;
    _campaignData!.mythic.chaosFactor = newValue;
    // TODO: CREATE ID
    // TODO: SAVE GENERIC ENTRY
    // TODO: SAVE JOURNAL ENTRY
    addGenericEntity(GenericEntryItem(
      title: 'RESET to $newValue',
      label: 'Chaos Factor',
      isFavourite: false,
    ));
    // saveCampaignDataToDisk();
  }

  //   SHOW POPUP
  void setPopupLabel(PopupLabels label) {
    _popupLabel = label;
    notifyListeners();
  }

  PopupLabels get popupLabel => _popupLabel;

  void toggleShowPopup() {
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

  // ZOCCHI DICE
  bool? get useZocchiDice => _campaignData?.settings.general.useZocchiDice;

  void toggleUseZocchiDice() {
    _campaignData?.settings.general.useZocchiDice =
        !_campaignData!.settings.general.useZocchiDice;
    // saveCampaignDataToDisk();
  }

  // JOURNAL ENTRIES
  void addJournalEntry(JournalEntryItem item) {
    _campaignData?.journal.add(item);
    // THIS SAVES FOR ALL ENTRY TYPES
    saveCampaignDataToDisk();
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

  void addRoll(Roll roll) {
    _campaignData?.rolls.add(roll);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: roll.type,
        id: roll.id,
      ),
    );
  }

  void addGenericEntity(GenericEntryItem genericEntryItem) {
    _campaignData?.generic.add(genericEntryItem);
    addJournalEntry(
      JournalEntryItem(
        isFavourite: false,
        type: genericEntryItem.type,
        id: genericEntryItem.id,
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
}

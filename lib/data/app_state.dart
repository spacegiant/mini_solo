import 'package:flutter/cupertino.dart';
import 'package:mini_solo/data/campaign_data.dart';
import 'package:mini_solo/utilities/id_generator.dart';

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
      // TODO: CREATE ID
      String id = idGenerator(JournalEntryTypes.chaosFactor);
      // TODO: SAVE GENERIC ENTRY
      // TODO: SAVE JOURNAL ENTRY
      addJournalEntry(JournalEntryItem(
        isFavourite: false,
        type: JournalEntryTypes.chaosFactor,
        id: idGenerator(JournalEntryTypes.chaosFactor),
      ));
      addGenericEntity(GenericEntryItem(
        title: 'UP to $newValue',
        type: JournalEntryTypes.chaosFactor,
        label: 'Chaos Factor',
        isFavourite: false,
      ));
    }
    saveCampaignDataToDisk();
  }

  void decreaseChaosFactor() {
    var cf = chaosFactor;
    if (cf > minChaos) {
      var newValue = cf - 1;
      _campaignData!.mythic.chaosFactor = newValue;
      // TODO: CREATE ID
      // TODO: SAVE GENERIC ENTRY
      // TODO: SAVE JOURNAL ENTRY
      addJournalEntry(JournalEntryItem(
        isFavourite: false,
        // title: 'DOWN to $newValue',
        type: JournalEntryTypes.chaosFactor,
        // label: 'Chaos Factor',
        id: '',
      ));
    }
    saveCampaignDataToDisk();
  }

  void resetChaosFactor() {
    _campaignData!.mythic.chaosFactor = 5;
    // TODO: CREATE ID
    // TODO: SAVE GENERIC ENTRY
    // TODO: SAVE JOURNAL ENTRY
    addJournalEntry(JournalEntryItem(
      isFavourite: false,
      // title: 'RESET to 5',
      type: JournalEntryTypes.chaosFactor,
      // label: 'Chaos Factor',
      id: '',
    ));
    saveCampaignDataToDisk();
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

  // JOURNAL ENTRIES
  void addJournalEntry(JournalEntryItem item) {
    _campaignData?.journal.add(item);
    saveCampaignDataToDisk();
  }

  // ZOCCHI DICE
  bool? get useZocchiDice => _campaignData?.settings.general.useZocchiDice;

  void toggleUseZocchiDice() {
    _campaignData?.settings.general.useZocchiDice =
        !_campaignData!.settings.general.useZocchiDice;
    saveCampaignDataToDisk();
  }

  void addGenericEntity(GenericEntryItem genericEntryItem) {}
}
